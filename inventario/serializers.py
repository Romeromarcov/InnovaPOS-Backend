# inventario/serializers.py
# Este archivo define los Serializers para tus modelos de Django REST Framework.

from rest_framework import serializers
from .models import ( # ¡Importación desde la misma app!
    Almacenes, CategoriasProducto, Clientes, Empleados, Fabricantes,
    Monedas, Productos, Proveedores, Roles, UnidadesMedida, Usuarios,
    ComisionesEmpleados, ComisionesPago, ComponentesProducto, Facturas,
    Inventario, MetodosPago, MovimientosInventario, Pedidos, RecibosPago,
    TasasCambio, TransaccionesFinancieras, UnidadesEmpaqueProducto, UsuarioRoles,
    VacacionesAusencias, Ventas, DetalleFactura, DetallePedido, DetalleVenta,
    ListasPrecio, RegistroAuditoria, Prestamos, CuotasPrestamo
)

# Serializers para modelos base
class AlmacenesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Almacenes
        fields = '__all__'

class CategoriasProductoSerializer(serializers.ModelSerializer):
    id_categoria_padre_nombre = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = CategoriasProducto
        fields = '__all__'

    def get_id_categoria_padre_nombre(self, obj):
        return obj.id_categoria_padre.nombre_categoria if obj.id_categoria_padre else None

class ClientesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Clientes
        fields = '__all__'

class FabricantesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Fabricantes
        fields = '__all__'

class MonedasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Monedas
        fields = '__all__'

class ProveedoresSerializer(serializers.ModelSerializer):
    id_cliente_asociado = ClientesSerializer(read_only=True) # Para lectura
    id_cliente_asociado_id = serializers.PrimaryKeyRelatedField( # Para escritura
        queryset=Clientes.objects.all(), source='id_cliente_asociado', write_only=True, required=False, allow_null=True
    )
    class Meta:
        model = Proveedores
        fields = '__all__'

class RolesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Roles
        fields = '__all__'

class UnidadesMedidaSerializer(serializers.ModelSerializer):
    class Meta:
        model = UnidadesMedida
        fields = '__all__'

class UsuariosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuarios
        fields = '__all__'
        extra_kwargs = {
            'contrasena_hash': {'write_only': True}
        }

class MetodosPagoSerializer(serializers.ModelSerializer):
    class Meta:
        model = MetodosPago
        fields = '__all__'

class ListasPrecioSerializer(serializers.ModelSerializer):
    class Meta:
        model = ListasPrecio
        fields = '__all__'

# Serializers para modelos con relaciones y nuevos campos
class ProductosSerializer(serializers.ModelSerializer):
    id_unidad_medida_base = UnidadesMedidaSerializer(read_only=True)
    id_moneda_costo = MonedasSerializer(read_only=True)
    id_categoria_principal = CategoriasProductoSerializer(read_only=True)
    id_fabricante = FabricantesSerializer(read_only=True)

    id_unidad_medida_base_id = serializers.PrimaryKeyRelatedField(
        queryset=UnidadesMedida.objects.all(), source='id_unidad_medida_base', write_only=True, required=False, allow_null=True
    )
    id_moneda_costo_id = serializers.PrimaryKeyRelatedField(
        queryset=Monedas.objects.all(), source='id_moneda_costo', write_only=True, required=False, allow_null=True
    )
    id_categoria_principal_id = serializers.PrimaryKeyRelatedField(
        queryset=CategoriasProducto.objects.all(), source='id_categoria_principal', write_only=True, required=False, allow_null=True
    )
    id_fabricante_id = serializers.PrimaryKeyRelatedField(
        queryset=Fabricantes.objects.all(), source='id_fabricante', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = Productos
        fields = '__all__'

class EmpleadosSerializer(serializers.ModelSerializer):
    id_usuario = UsuariosSerializer(read_only=True)
    id_usuario_id = serializers.PrimaryKeyRelatedField(
        queryset=Usuarios.objects.all(), source='id_usuario', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = Empleados
        fields = '__all__'

class TasasCambioSerializer(serializers.ModelSerializer):
    id_moneda_origen = MonedasSerializer(read_only=True)
    id_moneda_destino = MonedasSerializer(read_only=True)

    id_moneda_origen_id = serializers.PrimaryKeyRelatedField(
        queryset=Monedas.objects.all(), source='id_moneda_origen', write_only=True, required=False, allow_null=True
    )
    id_moneda_destino_id = serializers.PrimaryKeyRelatedField(
        queryset=Monedas.objects.all(), source='id_moneda_destino', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = TasasCambio
        fields = '__all__'

class PedidosSerializer(serializers.ModelSerializer):
    id_cliente = ClientesSerializer(read_only=True)
    id_almacen = AlmacenesSerializer(read_only=True)
    id_vendedor = EmpleadosSerializer(read_only=True)

    id_cliente_id = serializers.PrimaryKeyRelatedField(
        queryset=Clientes.objects.all(), source='id_cliente', write_only=True, required=False, allow_null=True
    )
    id_almacen_id = serializers.PrimaryKeyRelatedField(
        queryset=Almacenes.objects.all(), source='id_almacen', write_only=True, required=False, allow_null=True
    )
    id_vendedor_id = serializers.PrimaryKeyRelatedField(
        queryset=Empleados.objects.filter(es_vendedor=True), source='id_vendedor', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = Pedidos
        fields = '__all__'

class VentasSerializer(serializers.ModelSerializer):
    id_cliente = ClientesSerializer(read_only=True)
    id_almacen = AlmacenesSerializer(read_only=True)
    id_vendedor = EmpleadosSerializer(read_only=True)
    id_lista_precio = ListasPrecioSerializer(read_only=True)

    id_cliente_id = serializers.PrimaryKeyRelatedField(
        queryset=Clientes.objects.all(), source='id_cliente', write_only=True, required=False, allow_null=True
    )
    id_almacen_id = serializers.PrimaryKeyRelatedField(
        queryset=Almacenes.objects.all(), source='id_almacen', write_only=True, required=False, allow_null=True
    )
    id_vendedor_id = serializers.PrimaryKeyRelatedField(
        queryset=Empleados.objects.filter(es_vendedor=True), source='id_vendedor', write_only=True, required=False, allow_null=True
    )
    id_lista_precio_id = serializers.PrimaryKeyRelatedField(
        queryset=ListasPrecio.objects.all(), source='id_lista_precio', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = Ventas
        fields = '__all__'

class FacturasSerializer(serializers.ModelSerializer):
    id_pedido = PedidosSerializer(read_only=True)
    id_cliente = ClientesSerializer(read_only=True)

    id_pedido_id = serializers.PrimaryKeyRelatedField(
        queryset=Pedidos.objects.all(), source='id_pedido', write_only=True, required=False, allow_null=True
    )
    id_cliente_id = serializers.PrimaryKeyRelatedField(
        queryset=Clientes.objects.all(), source='id_cliente', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = Facturas
        fields = '__all__'

class RecibosPagoSerializer(serializers.ModelSerializer):
    id_factura = FacturasSerializer(read_only=True)
    id_metodo_pago = MetodosPagoSerializer(read_only=True)

    id_factura_id = serializers.PrimaryKeyRelatedField(
        queryset=Facturas.objects.all(), source='id_factura', write_only=True, required=False, allow_null=True
    )
    id_metodo_pago_id = serializers.PrimaryKeyRelatedField(
        queryset=MetodosPago.objects.all(), source='id_metodo_pago', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = RecibosPago
        fields = '__all__'

class ComisionesEmpleadosSerializer(serializers.ModelSerializer):
    id_empleado = EmpleadosSerializer(read_only=True)
    id_recibo_pago = RecibosPagoSerializer(read_only=True)

    id_empleado_id = serializers.PrimaryKeyRelatedField(
        queryset=Empleados.objects.all(), source='id_empleado', write_only=True, required=False, allow_null=True
    )
    id_recibo_pago_id = serializers.PrimaryKeyRelatedField(
        queryset=RecibosPago.objects.all(), source='id_recibo_pago', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = ComisionesEmpleados
        fields = '__all__'

class ComisionesPagoSerializer(serializers.ModelSerializer):
    id_metodo_pago = MetodosPagoSerializer(read_only=True)

    id_metodo_pago_id = serializers.PrimaryKeyRelatedField(
        queryset=MetodosPago.objects.all(), source='id_metodo_pago', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = ComisionesPago
        fields = '__all__'

class ComponentesProductoSerializer(serializers.ModelSerializer):
    id_producto_principal = ProductosSerializer(read_only=True)
    id_producto_componente = ProductosSerializer(read_only=True)
    id_unidad_medida_componente = UnidadesMedidaSerializer(read_only=True)

    id_producto_principal_id = serializers.PrimaryKeyRelatedField(
        queryset=Productos.objects.all(), source='id_producto_principal', write_only=True, required=False, allow_null=True
    )
    id_producto_componente_id = serializers.PrimaryKeyRelatedField(
        queryset=Productos.objects.all(), source='id_producto_componente', write_only=True, required=False, allow_null=True
    )
    id_unidad_medida_componente_id = serializers.PrimaryKeyRelatedField(
        queryset=UnidadesMedida.objects.all(), source='id_unidad_medida_componente', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = ComponentesProducto
        fields = '__all__'

class InventarioSerializer(serializers.ModelSerializer):
    id_producto = ProductosSerializer(read_only=True)
    id_almacen = AlmacenesSerializer(read_only=True)

    id_producto_id = serializers.PrimaryKeyRelatedField(
        queryset=Productos.objects.all(), source='id_producto', write_only=True, required=False, allow_null=True
    )
    id_almacen_id = serializers.PrimaryKeyRelatedField(
        queryset=Almacenes.objects.all(), source='id_almacen', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = Inventario
        fields = '__all__'

class MovimientosInventarioSerializer(serializers.ModelSerializer):
    id_producto = ProductosSerializer(read_only=True)
    id_almacen = AlmacenesSerializer(read_only=True)
    id_usuario = UsuariosSerializer(read_only=True)

    id_producto_id = serializers.PrimaryKeyRelatedField(
        queryset=Productos.objects.all(), source='id_producto', write_only=True, required=False, allow_null=True
    )
    id_almacen_id = serializers.PrimaryKeyRelatedField(
        queryset=Almacenes.objects.all(), source='id_almacen', write_only=True, required=False, allow_null=True
    )
    id_usuario_id = serializers.PrimaryKeyRelatedField(
        queryset=Usuarios.objects.all(), source='id_usuario', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = MovimientosInventario
        fields = '__all__'

class TransaccionesFinancierasSerializer(serializers.ModelSerializer):
    id_usuario = UsuariosSerializer(read_only=True)

    id_usuario_id = serializers.PrimaryKeyRelatedField(
        queryset=Usuarios.objects.all(), source='id_usuario', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = TransaccionesFinancieras
        fields = '__all__'

class UnidadesEmpaqueProductoSerializer(serializers.ModelSerializer):
    id_producto = ProductosSerializer(read_only=True)
    id_unidad_medida = UnidadesMedidaSerializer(read_only=True)

    id_producto_id = serializers.PrimaryKeyRelatedField(
        queryset=Productos.objects.all(), source='id_producto', write_only=True, required=False, allow_null=True
    )
    id_unidad_medida_id = serializers.PrimaryKeyRelatedField(
        queryset=UnidadesMedida.objects.all(), source='id_unidad_medida', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = UnidadesEmpaqueProducto
        fields = '__all__'

class UsuarioRolesSerializer(serializers.ModelSerializer):
    id_usuario = UsuariosSerializer(read_only=True)
    id_rol = RolesSerializer(read_only=True)

    id_usuario_id = serializers.PrimaryKeyRelatedField(
        queryset=Usuarios.objects.all(), source='id_usuario', write_only=True, required=False, allow_null=True
    )
    id_rol_id = serializers.PrimaryKeyRelatedField(
        queryset=Roles.objects.all(), source='id_rol', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = UsuarioRoles
        fields = '__all__'

class VacacionesAusenciasSerializer(serializers.ModelSerializer):
    id_empleado = EmpleadosSerializer(read_only=True)

    id_empleado_id = serializers.PrimaryKeyRelatedField(
        queryset=Empleados.objects.all(), source='id_empleado', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = VacacionesAusencias
        fields = '__all__'

class DetalleFacturaSerializer(serializers.ModelSerializer):
    id_factura = FacturasSerializer(read_only=True)
    id_producto = ProductosSerializer(read_only=True)

    id_factura_id = serializers.PrimaryKeyRelatedField(
        queryset=Facturas.objects.all(), source='id_factura', write_only=True, required=False, allow_null=True
    )
    id_producto_id = serializers.PrimaryKeyRelatedField(
        queryset=Productos.objects.all(), source='id_producto', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = DetalleFactura
        fields = '__all__'

class DetallePedidoSerializer(serializers.ModelSerializer):
    id_pedido = PedidosSerializer(read_only=True)
    id_producto = ProductosSerializer(read_only=True)

    id_pedido_id = serializers.PrimaryKeyRelatedField(
        queryset=Pedidos.objects.all(), source='id_pedido', write_only=True, required=False, allow_null=True
    )
    id_producto_id = serializers.PrimaryKeyRelatedField(
        queryset=Productos.objects.all(), source='id_producto', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = DetallePedido
        fields = '__all__'

class DetalleVentaSerializer(serializers.ModelSerializer):
    id_venta = VentasSerializer(read_only=True)
    id_producto = ProductosSerializer(read_only=True)

    id_venta_id = serializers.PrimaryKeyRelatedField(
        queryset=Ventas.objects.all(), source='id_venta', write_only=True, required=False, allow_null=True
    )
    id_producto_id = serializers.PrimaryKeyRelatedField(
        queryset=Productos.objects.all(), source='id_producto', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = DetalleVenta
        fields = '__all__'

# Nuevos Serializers para Auditoría y Préstamos
class RegistroAuditoriaSerializer(serializers.ModelSerializer):
    id_usuario = UsuariosSerializer(read_only=True)
    id_usuario_id = serializers.PrimaryKeyRelatedField(
        queryset=Usuarios.objects.all(), source='id_usuario', write_only=True, required=False, allow_null=True
    )
    class Meta:
        model = RegistroAuditoria
        fields = '__all__'
        read_only_fields = ('fecha_accion',) # Fecha de acción se genera automáticamente

class CuotasPrestamoSerializer(serializers.ModelSerializer):
    id_prestamo = serializers.PrimaryKeyRelatedField(
        queryset=Prestamos.objects.all(), source='id_prestamo', write_only=True
    )
    id_transaccion_pago = TransaccionesFinancierasSerializer(read_only=True)
    id_transaccion_pago_id = serializers.PrimaryKeyRelatedField(
        queryset=TransaccionesFinancieras.objects.all(), source='id_transaccion_pago', write_only=True, required=False, allow_null=True
    )
    class Meta:
        model = CuotasPrestamo
        fields = '__all__'
        read_only_fields = ('fecha_creacion', 'fecha_actualizacion')

class PrestamosSerializer(serializers.ModelSerializer):
    id_empleado = EmpleadosSerializer(read_only=True)
    id_cliente = ClientesSerializer(read_only=True)
    cuotas = CuotasPrestamoSerializer(many=True, read_only=True) # Para ver las cuotas anidadas

    id_empleado_id = serializers.PrimaryKeyRelatedField(
        queryset=Empleados.objects.all(), source='id_empleado', write_only=True, required=False, allow_null=True
    )
    id_cliente_id = serializers.PrimaryKeyRelatedField(
        queryset=Clientes.objects.all(), source='id_cliente', write_only=True, required=False, allow_null=True
    )

    class Meta:
        model = Prestamos
        fields = '__all__'
        read_only_fields = ('fecha_creacion', 'fecha_actualizacion', 'fecha_fin_estimada') # Se calcula en la lógica de negocio
