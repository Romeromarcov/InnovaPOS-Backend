# inventario/views.py

from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import action
from django.db import transaction
from django.utils import timezone
from decimal import Decimal

from .models import ( # Importación desde la misma app
    Almacenes, CategoriasProducto, Clientes, Empleados, Fabricantes,
    Monedas, Productos, Proveedores, Roles, UnidadesMedida, Usuarios,
    ComisionesEmpleados, ComisionesPago, ComponentesProducto, Facturas,
    Inventario, MetodosPago, MovimientosInventario, Pedidos, RecibosPago,
    TasasCambio, TransaccionesFinancieras, UnidadesEmpaqueProducto, UsuarioRoles,
    VacacionesAusencias, Ventas, DetalleFactura, DetallePedido, DetalleVenta,
    ListasPrecio, RegistroAuditoria, Prestamos, CuotasPrestamo
)
from .serializers import ( # Importación desde la misma app
    AlmacenesSerializer, CategoriasProductoSerializer, ClientesSerializer, EmpleadosSerializer, FabricantesSerializer,
    MonedasSerializer, ProductosSerializer, ProveedoresSerializer, RolesSerializer, UnidadesMedidaSerializer, UsuariosSerializer,
    ComisionesEmpleadosSerializer, ComisionesPagoSerializer, ComponentesProductoSerializer, FacturasSerializer,
    InventarioSerializer, MetodosPagoSerializer, MovimientosInventarioSerializer, PedidosSerializer, RecibosPagoSerializer,
    TasasCambioSerializer, TransaccionesFinancierasSerializer, UnidadesEmpaqueProductoSerializer, UsuarioRolesSerializer,
    VacacionesAusenciasSerializer, VentasSerializer, DetalleFacturaSerializer, DetallePedidoSerializer, DetalleVentaSerializer,
    ListasPrecioSerializer, RegistroAuditoriaSerializer, PrestamosSerializer, CuotasPrestamoSerializer
)

# --- ViewSets para Modelos Base ---

class AlmacenesViewSet(viewsets.ModelViewSet):
    queryset = Almacenes.objects.all()
    serializer_class = AlmacenesSerializer

class CategoriasProductoViewSet(viewsets.ModelViewSet):
    queryset = CategoriasProducto.objects.all()
    serializer_class = CategoriasProductoSerializer

class ClientesViewSet(viewsets.ModelViewSet):
    queryset = Clientes.objects.all()
    serializer_class = ClientesSerializer

class FabricantesViewSet(viewsets.ModelViewSet):
    queryset = Fabricantes.objects.all()
    serializer_class = FabricantesSerializer

class MonedasViewSet(viewsets.ModelViewSet):
    queryset = Monedas.objects.all()
    serializer_class = MonedasSerializer

class ProveedoresViewSet(viewsets.ModelViewSet):
    queryset = Proveedores.objects.all()
    serializer_class = ProveedoresSerializer

    @action(detail=True, methods=['post'])
    def compensar_documentos(self, request, pk=None):
        """
        Permite compensar documentos de venta de un cliente con documentos de compra a un proveedor,
        si el proveedor es también cliente y coincide el RIF/nombre.
        Esto es una simplificación; la lógica real sería más compleja y segura.
        """
        proveedor = self.get_object()
        if not proveedor.es_cliente or not proveedor.id_cliente_asociado:
            return Response({"detail": "Este proveedor no está asociado a un cliente para compensación."}, status=status.HTTP_400_BAD_REQUEST)

        monto_a_compensar = Decimal(request.data.get('monto', 0))
        if monto_a_compensar <= 0:
            return Response({"detail": "El monto a compensar debe ser positivo."}, status=status.HTTP_400_BAD_REQUEST)

        cliente_asociado = proveedor.id_cliente_asociado

        with transaction.atomic():
            # Lógica simplificada: Buscar facturas pendientes del cliente
            # y compras pendientes del proveedor y realizar la compensación.
            # En un sistema real, esto implicaría seleccionar documentos específicos.

            # Ejemplo: Reducir saldo de Facturas pendientes del cliente
            facturas_pendientes_cliente = Facturas.objects.filter(id_cliente=cliente_asociado, estado='Pendiente').order_by('fecha_factura')
            monto_compensado_cliente = Decimal(0)
            for factura in facturas_pendientes_cliente:
                if monto_compensado_cliente >= monto_a_compensar:
                    break
                # Asumiendo que Facturas tiene un campo para saldo pendiente o se calcula
                # saldo_factura = factura.total_factura - factura.recibospago_set.aggregate(sum_pagos=models.Sum('monto_pago'))['sum_pagos'] or Decimal(0)
                # if saldo_factura > 0:
                #     compensacion_actual = min(saldo_factura, monto_a_compensar - monto_compensado_cliente)
                #     # Aquí se crearía un recibo de pago o ajuste para la factura
                #     # RecibosPago.objects.create(id_factura=factura, monto_pago=compensacion_actual, ...)
                #     monto_compensado_cliente += compensacion_actual
                #     # Actualizar estado de factura si se paga completamente
                pass # Lógica de compensación real aquí

            # Ejemplo: Reducir saldo de Compras pendientes al proveedor
            # Suponiendo un modelo para Compras
            # compras_pendientes_proveedor = Compras.objects.filter(id_proveedor=proveedor, estado='Pendiente').order_by('fecha_compra')
            # monto_compensado_proveedor = Decimal(0)
            # for compra in compras_pendientes_proveedor:
            #     if monto_compensado_proveedor >= monto_a_compensar:
            #         break
            #     # saldo_compra = compra.total_compra - ...
            #     # if saldo_compra > 0:
            #     #     compensacion_actual = min(saldo_compra, monto_a_compensar - monto_compensado_proveedor)
            #     #     # Aquí se crearía un pago o ajuste para la compra
            #     #     monto_compensado_proveedor += compensacion_actual
            pass # Lógica de compensación real aquí

            # Registrar la transacción financiera de compensación
            TransaccionesFinancieras.objects.create(
                tipo_transaccion='COMPENSACION',
                monto=monto_a_compensar,
                descripcion=f"Compensación de documentos entre cliente {cliente_asociado.nombre} y proveedor {proveedor.nombre_proveedor}",
                # id_usuario=request.user.usuarios_perfil if request.user.is_authenticated else None # Asumiendo relación con Usuarios
                id_usuario=Usuarios.objects.first() # Placeholder si no hay autenticación de usuario
            )
            # Registrar en auditoría
            RegistroAuditoria.objects.create(
                # id_usuario=request.user.usuarios_perfil if request.user.is_authenticated else None,
                id_usuario=Usuarios.objects.first(), # Placeholder
                accion='COMPENSACION_DOCUMENTOS',
                modelo_afectado='Proveedor/Cliente',
                id_objeto_afectado=f"Cliente:{cliente_asociado.id}/Proveedor:{proveedor.id}",
                cambios_json={'monto_compensado': str(monto_a_compensar)}
            )

        return Response({"detail": f"Compensación de {monto_a_compensar} procesada."}, status=status.HTTP_200_OK)


class RolesViewSet(viewsets.ModelViewSet):
    queryset = Roles.objects.all()
    serializer_class = RolesSerializer

class UnidadesMedidaViewSet(viewsets.ModelViewSet):
    queryset = UnidadesMedida.objects.all()
    serializer_class = UnidadesMedidaSerializer

class UsuariosViewSet(viewsets.ModelViewSet):
    queryset = Usuarios.objects.all()
    serializer_class = UsuariosSerializer

class MetodosPagoViewSet(viewsets.ModelViewSet):
    queryset = MetodosPago.objects.all()
    serializer_class = MetodosPagoSerializer

class ListasPrecioViewSet(viewsets.ModelViewSet):
    queryset = ListasPrecio.objects.all()
    serializer_class = ListasPrecioSerializer

# --- ViewSets para Modelos con Lógica Adicional ---

class ProductosViewSet(viewsets.ModelViewSet):
    queryset = Productos.objects.all()
    serializer_class = ProductosSerializer

class EmpleadosViewSet(viewsets.ModelViewSet):
    queryset = Empleados.objects.all()
    serializer_class = EmpleadosSerializer

class TasasCambioViewSet(viewsets.ModelViewSet):
    queryset = TasasCambio.objects.all()
    serializer_class = TasasCambioSerializer

class PedidosViewSet(viewsets.ModelViewSet):
    queryset = Pedidos.objects.all()
    serializer_class = PedidosSerializer

class VentasViewSet(viewsets.ModelViewSet):
    queryset = Ventas.objects.all()
    serializer_class = VentasSerializer

class FacturasViewSet(viewsets.ModelViewSet):
    queryset = Facturas.objects.all()
    serializer_class = FacturasSerializer

class RecibosPagoViewSet(viewsets.ModelViewSet):
    queryset = RecibosPago.objects.all()
    serializer_class = RecibosPagoSerializer

class ComisionesEmpleadosViewSet(viewsets.ModelViewSet):
    queryset = ComisionesEmpleados.objects.all()
    serializer_class = ComisionesEmpleadosSerializer

    @action(detail=False, methods=['post'])
    def calcular_comisiones(self, request):
        """
        Calcula y registra comisiones para vendedores en un rango de fechas.
        Esto es una lógica simplificada.
        """
        fecha_inicio_str = request.data.get('fecha_inicio')
        fecha_fin_str = request.data.get('fecha_fin')
        id_vendedor = request.data.get('id_vendedor') # Opcional: calcular para un vendedor específico

        if not fecha_inicio_str or not fecha_fin_str:
            return Response({"detail": "Fechas de inicio y fin son requeridas."}, status=status.HTTP_400_BAD_REQUEST)

        try:
            fecha_inicio = timezone.datetime.strptime(fecha_inicio_str, '%Y-%m-%d').date()
            fecha_fin = timezone.datetime.strptime(fecha_fin_str, '%Y-%m-%d').date()
        except ValueError:
            return Response({"detail": "Formato de fecha inválido. Use Букмекерлар-MM-DD."}, status=status.HTTP_400_BAD_REQUEST)

        vendedores = Empleados.objects.filter(es_vendedor=True)
        if id_vendedor:
            vendedores = vendedores.filter(id=id_vendedor)

        comisiones_generadas = []
        with transaction.atomic():
            for vendedor in vendedores:
                ventas_vendedor = Ventas.objects.filter(
                    id_vendedor=vendedor,
                    fecha_venta__date__range=(fecha_inicio, fecha_fin),
                    estado='Completada' # Solo ventas completadas
                )

                total_comision_vendedor = Decimal(0)
                for venta in ventas_vendedor:
                    # Lógica de comisión: priorizar lista de precio, luego producto
                    comision_aplicada = Decimal(0)
                    if venta.id_lista_precio and venta.id_lista_precio.tiene_comision and venta.id_lista_precio.porcentaje_comision is not None:
                        comision_aplicada = venta.id_lista_precio.porcentaje_comision
                    elif venta.id_producto and venta.id_producto.tiene_comision_producto and venta.id_producto.porcentaje_comision_producto is not None:
                        comision_aplicada = venta.id_producto.porcentaje_comision_producto

                    if comision_aplicada > 0:
                        total_comision_venta = (venta.total_venta * comision_aplicada) / Decimal(100)
                        total_comision_vendedor += total_comision_venta

                if total_comision_vendedor > 0:
                    comision_empleado = ComisionesEmpleados.objects.create(
                        id_empleado=vendedor,
                        monto_comision=total_comision_vendedor,
                        fecha_comision=timezone.now().date(),
                        estado='Pendiente'
                    )
                    comisiones_generadas.append(ComisionesEmpleadosSerializer(comision_empleado).data)

        return Response({"detail": "Cálculo de comisiones completado.", "comisiones_generadas": comisiones_generadas}, status=status.HTTP_200_OK)


class ComisionesPagoViewSet(viewsets.ModelViewSet): # ¡Esta es la definición correcta!
    queryset = ComisionesPago.objects.all()
    serializer_class = ComisionesPagoSerializer

class ComponentesProductoViewSet(viewsets.ModelViewSet):
    queryset = ComponentesProducto.objects.all()
    serializer_class = ComponentesProductoSerializer

class InventarioViewSet(viewsets.ModelViewSet):
    queryset = Inventario.objects.all()
    serializer_class = InventarioSerializer

class MovimientosInventarioViewSet(viewsets.ModelViewSet):
    queryset = MovimientosInventario.objects.all()
    serializer_class = MovimientosInventarioSerializer

class TransaccionesFinancierasViewSet(viewsets.ModelViewSet):
    queryset = TransaccionesFinancieras.objects.all()
    serializer_class = TransaccionesFinancierasSerializer

class UnidadesEmpaqueProductoViewSet(viewsets.ModelViewSet):
    queryset = UnidadesEmpaqueProducto.objects.all()
    serializer_class = UnidadesEmpaqueProductoSerializer

class UsuarioRolesViewSet(viewsets.ModelViewSet):
    queryset = UsuarioRoles.objects.all()
    serializer_class = UsuarioRolesSerializer

class VacacionesAusenciasViewSet(viewsets.ModelViewSet):
    queryset = VacacionesAusencias.objects.all()
    serializer_class = VacacionesAusenciasSerializer

class DetalleFacturaViewSet(viewsets.ModelViewSet):
    queryset = DetalleFactura.objects.all()
    serializer_class = DetalleFacturaSerializer

class DetallePedidoViewSet(viewsets.ModelViewSet):
    queryset = DetallePedido.objects.all()
    serializer_class = DetallePedidoSerializer

class DetalleVentaViewSet(viewsets.ModelViewSet):
    queryset = DetalleVenta.objects.all()
    serializer_class = DetalleVentaSerializer

# Nuevos ViewSets para Auditoría y Préstamos
class RegistroAuditoriaViewSet(viewsets.ReadOnlyModelViewSet): # Solo lectura para auditoría
    queryset = RegistroAuditoria.objects.all()
    serializer_class = RegistroAuditoriaSerializer

class PrestamosViewSet(viewsets.ModelViewSet):
    queryset = Prestamos.objects.all()
    serializer_class = PrestamosSerializer

    def perform_create(self, serializer):
        """
        Al crear un préstamo, calcula las cuotas y las guarda.
        """
        with transaction.atomic():
            prestamo = serializer.save()
            # Lógica simplificada para calcular cuotas (ej. cuotas fijas)
            monto_cuota_capital = prestamo.monto_principal / prestamo.plazo_meses
            # La lógica de interés real es más compleja (amortización)
            monto_interes_por_cuota = (prestamo.monto_principal * prestamo.tasa_interes / 100) / prestamo.plazo_meses
            monto_total_cuota = monto_cuota_capital + monto_interes_por_cuota

            for i in range(1, prestamo.plazo_meses + 1):
                fecha_vencimiento = prestamo.fecha_inicio + timezone.timedelta(days=30 * i) # Simplificado a 30 días por mes
                CuotasPrestamo.objects.create(
                    id_prestamo=prestamo,
                    numero_cuota=i,
                    fecha_vencimiento=fecha_vencimiento,
                    monto_capital=monto_cuota_capital,
                    monto_interes=monto_interes_por_cuota,
                    monto_total_cuota=monto_total_cuota,
                    estado='PENDIENTE'
                )
            # Actualizar fecha fin estimada del préstamo
            prestamo.fecha_fin_estimada = fecha_vencimiento
            prestamo.save()

            # Registrar en auditoría
            RegistroAuditoria.objects.create(
                # id_usuario=self.request.user.usuarios_perfil if self.request.user.is_authenticated else None,
                id_usuario=Usuarios.objects.first(), # Placeholder si no hay autenticación de usuario
                accion='CREATE',
                modelo_afectado='Prestamo',
                id_objeto_afectado=str(prestamo.id),
                cambios_json=serializer.data
            )


class CuotasPrestamoViewSet(viewsets.ModelViewSet):
    queryset = CuotasPrestamo.objects.all()
    serializer_class = CuotasPrestamoSerializer

    @action(detail=True, methods=['post'])
    def registrar_pago(self, request, pk=None):
        cuota = self.get_object()
        monto_pagado = Decimal(request.data.get('monto_pagado', 0))
        id_metodo_pago = request.data.get('id_metodo_pago')

        if monto_pagado <= 0:
            return Response({"detail": "El monto pagado debe ser positivo."}, status=status.HTTP_400_BAD_REQUEST)
        if cuota.estado == 'PAGADA':
            return Response({"detail": "Esta cuota ya ha sido pagada."}, status=status.HTTP_400_BAD_REQUEST)
        if monto_pagado < cuota.monto_total_cuota:
             return Response({"detail": "El monto pagado es menor al monto total de la cuota."}, status=status.HTTP_400_BAD_REQUEST)

        with transaction.atomic():
            # Crear transacción financiera para el pago
            transaccion = TransaccionesFinancieras.objects.create(
                tipo_transaccion='PAGO_PRESTAMO',
                monto=monto_pagado,
                descripcion=f"Pago de cuota {cuota.numero_cuota} de préstamo {cuota.id_prestamo_id}",
                # id_usuario=request.user.usuarios_perfil if request.user.is_authenticated else None,
                id_usuario=Usuarios.objects.first(), # Placeholder
                # id_documento_asociado=str(cuota.id) # Podrías asociar el ID de la cuota
            )

            cuota.fecha_pago = timezone.now().date()
            cuota.estado = 'PAGADA'
            cuota.id_transaccion_pago = transaccion
            cuota.save()

            # Registrar en auditoría
            RegistroAuditoria.objects.create(
                # id_usuario=self.request.user.usuarios_perfil if self.request.user.is_authenticated else None,
                id_usuario=Usuarios.objects.first(), # Placeholder
                accion='PAGO_CUOTA_PRESTAMO',
                modelo_afectado='CuotaPrestamo',
                id_objeto_afectado=str(cuota.id),
                cambios_json={'monto_pagado': str(monto_pagado), 'estado_anterior': 'PENDIENTE', 'estado_nuevo': 'PAGADA'}
            )

        return Response({"detail": "Pago de cuota registrado exitosamente."}, status=status.HTTP_200_OK)
