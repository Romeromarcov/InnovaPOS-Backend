# inventario/models.py
# Modelos de Django para tu sistema InnovaPOS, con mejoras para futuras funcionalidades.

from django.db import models
from django.contrib.auth.models import AbstractUser # Para un modelo de usuario más avanzado si decides usarlo

# --- Modelos Base ---

class Almacenes(models.Model):
    nombre_almacen = models.CharField(unique=True, max_length=100)
    direccion = models.CharField(max_length=255, blank=True, null=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=100, blank=True, null=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True) # Se establece automáticamente al crear
    fecha_actualizacion = models.DateTimeField(auto_now=True) # Se actualiza automáticamente al guardar

    class Meta:
        db_table = 'almacenes'
        verbose_name = 'Almacén'
        verbose_name_plural = 'Almacenes'

    def __str__(self):
        return self.nombre_almacen

class CategoriasProducto(models.Model):
    nombre_categoria = models.CharField(unique=True, max_length=100)
    descripcion = models.CharField(max_length=255, blank=True, null=True)
    id_categoria_padre = models.ForeignKey('self', models.SET_NULL, db_column='id_categoria_padre', blank=True, null=True, related_name='subcategorias') # Cambiado a SET_NULL
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'categorias_producto'
        verbose_name = 'Categoría de Producto'
        verbose_name_plural = 'Categorías de Productos'

    def __str__(self):
        return self.nombre_categoria

class Clientes(models.Model):
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    direccion = models.CharField(max_length=255, blank=True, null=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=100, blank=True, null=True)
    fecha_nacimiento = models.DateField(blank=True, null=True)
    tipo_documento = models.CharField(max_length=50, blank=True, null=True)
    numero_documento = models.CharField(unique=True, max_length=50, blank=True, null=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'clientes'
        verbose_name = 'Cliente'
        verbose_name_plural = 'Clientes'

    def __str__(self):
        return f"{self.nombre} {self.apellido}"

class Fabricantes(models.Model):
    nombre_fabricante = models.CharField(unique=True, max_length=100)
    contacto = models.CharField(max_length=100, blank=True, null=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=100, blank=True, null=True)
    direccion = models.CharField(max_length=255, blank=True, null=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'fabricantes'
        verbose_name = 'Fabricante'
        verbose_name_plural = 'Fabricantes'

    def __str__(self):
        return self.nombre_fabricante

class Monedas(models.Model):
    nombre_moneda = models.CharField(unique=True, max_length=50)
    simbolo = models.CharField(max_length=10, blank=True, null=True)
    codigo_iso = models.CharField(unique=True, max_length=3, blank=True, null=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'monedas'
        verbose_name = 'Moneda'
        verbose_name_plural = 'Monedas'

    def __str__(self):
        return self.nombre_moneda

class UnidadesMedida(models.Model):
    nombre_unidad = models.CharField(unique=True, max_length=50)
    simbolo = models.CharField(max_length=10, blank=True, null=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'unidades_medida'
        verbose_name = 'Unidad de Medida'
        verbose_name_plural = 'Unidades de Medida'

    def __str__(self):
        return self.nombre_unidad

class Proveedores(models.Model):
    nombre_proveedor = models.CharField(unique=True, max_length=100)
    contacto = models.CharField(max_length=100, blank=True, null=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=100, blank=True, null=True)
    direccion = models.CharField(max_length=255, blank=True, null=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)
    # Nuevo: Para la compensación, si un proveedor es también cliente
    es_cliente = models.BooleanField(default=False)
    id_cliente_asociado = models.ForeignKey('Clientes', models.SET_NULL, db_column='id_cliente_asociado', blank=True, null=True, related_name='proveedores_asociados')

    class Meta:
        db_table = 'proveedores'
        verbose_name = 'Proveedor'
        verbose_name_plural = 'Proveedores'

    def __str__(self):
        return self.nombre_proveedor

class Roles(models.Model):
    nombre_rol = models.CharField(unique=True, max_length=50)
    descripcion = models.CharField(max_length=255, blank=True, null=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'roles'
        verbose_name = 'Rol'
        verbose_name_plural = 'Roles'

    def __str__(self):
        return self.nombre_rol

# --- Modelos de Usuario y Empleado (considerando User de Django) ---

# Usaremos el modelo Usuarios original por ahora para mantener la consistencia con tu esquema
# Si decides usar CustomUser (AbstractUser), deberás adaptar Empleados y otras FKs.
class Usuarios(models.Model):
    nombre_usuario = models.CharField(unique=True, max_length=50)
    contrasena_hash = models.CharField(max_length=255) # Django gestiona esto automáticamente con User
    email = models.CharField(unique=True, max_length=100, blank=True, null=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'usuarios'
        verbose_name = 'Usuario'
        verbose_name_plural = 'Usuarios'

    def __str__(self):
        return self.nombre_usuario

class Empleados(models.Model):
    id_usuario = models.OneToOneField('Usuarios', models.SET_NULL, db_column='id_usuario', blank=True, null=True, related_name='empleado_perfil')
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    fecha_contratacion = models.DateField(blank=True, null=True)
    cargo = models.CharField(max_length=100, blank=True, null=True)
    salario = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    activo = models.BooleanField(default=True)
    es_vendedor = models.BooleanField(default=False) # Nuevo: para identificar vendedores
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'empleados'
        verbose_name = 'Empleado'
        verbose_name_plural = 'Empleados'

    def __str__(self):
        return f"{self.nombre} {self.apellido}"

# --- Nuevos Modelos para Funcionalidades Avanzadas ---

class ListasPrecio(models.Model): # Nuevo modelo para listas de precio
    nombre_lista = models.CharField(unique=True, max_length=100)
    descripcion = models.CharField(max_length=255, blank=True, null=True)
    activo = models.BooleanField(default=True)
    tiene_comision = models.BooleanField(default=False) # Nuevo: si la lista tiene comisión
    porcentaje_comision = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True) # Nuevo: porcentaje de comisión para la lista
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'listas_precio'
        verbose_name = 'Lista de Precio'
        verbose_name_plural = 'Listas de Precios'

    def __str__(self):
        return self.nombre_lista

class Productos(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField(blank=True, null=True)
    sku = models.CharField(unique=True, max_length=100, blank=True, null=True)
    costo_unitario = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    id_unidad_medida_base = models.ForeignKey('UnidadesMedida', models.SET_NULL, db_column='id_unidad_medida_base', blank=True, null=True)
    id_moneda_costo = models.ForeignKey('Monedas', models.SET_NULL, db_column='id_moneda_costo', blank=True, null=True)
    id_categoria_principal = models.ForeignKey('CategoriasProducto', models.SET_NULL, db_column='id_categoria_principal', blank=True, null=True)
    id_fabricante = models.ForeignKey('Fabricantes', models.SET_NULL, db_column='id_fabricante', blank=True, null=True)
    activo = models.BooleanField(default=True)
    # Nuevos campos para comisión de producto
    tiene_comision_producto = models.BooleanField(default=False)
    porcentaje_comision_producto = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'productos'
        verbose_name = 'Producto'
        verbose_name_plural = 'Productos'

    def __str__(self):
        return self.nombre

class Pedidos(models.Model):
    id_cliente = models.ForeignKey('Clientes', models.SET_NULL, db_column='id_cliente', blank=True, null=True)
    fecha_pedido = models.DateTimeField(auto_now_add=True) # Auto-establecer fecha de pedido
    total_pedido = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    estado = models.CharField(max_length=50, blank=True, null=True) # Ej: 'Pendiente', 'Procesado', 'Cancelado'
    id_almacen = models.ForeignKey('Almacenes', models.SET_NULL, db_column='id_almacen', blank=True, null=True) # Nuevo: Almacén del pedido
    id_vendedor = models.ForeignKey('Empleados', models.SET_NULL, db_column='id_vendedor', blank=True, null=True, related_name='pedidos_realizados') # Nuevo: Vendedor asociado al pedido
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'pedidos'
        verbose_name = 'Pedido'
        verbose_name_plural = 'Pedidos'

    def __str__(self):
        return f"Pedido {self.id}"

class Ventas(models.Model):
    id_cliente = models.ForeignKey('Clientes', models.SET_NULL, db_column='id_cliente', blank=True, null=True)
    fecha_venta = models.DateTimeField(auto_now_add=True) # Auto-establecer fecha de venta
    total_venta = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    estado = models.CharField(max_length=50, blank=True, null=True) # Ej: 'Completada', 'Anulada'
    id_almacen = models.ForeignKey('Almacenes', models.SET_NULL, db_column='id_almacen', blank=True, null=True) # Nuevo: Almacén de la venta
    id_vendedor = models.ForeignKey('Empleados', models.SET_NULL, db_column='id_vendedor', blank=True, null=True, related_name='ventas_realizadas') # Nuevo: Vendedor asociado a la venta
    id_lista_precio = models.ForeignKey('ListasPrecio', models.SET_NULL, db_column='id_lista_precio', blank=True, null=True) # Nuevo: Lista de precio usada
    es_fiscal = models.BooleanField(default=False) # Nuevo: Para gestión fiscal/no fiscal
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'ventas'
        verbose_name = 'Venta'
        verbose_name_plural = 'Ventas'

    def __str__(self):
        return f"Venta {self.id}"

class DetallePedido(models.Model):
    id_pedido = models.ForeignKey('Pedidos', models.CASCADE, db_column='id_pedido', related_name='detalles_pedido') # CASCADE para eliminar detalles si se elimina el pedido
    id_producto = models.ForeignKey('Productos', models.SET_NULL, db_column='id_producto', blank=True, null=True)
    cantidad = models.DecimalField(max_digits=10, decimal_places=2)
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)
    subtotal = models.DecimalField(max_digits=10, decimal_places=2)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'detalle_pedido'
        unique_together = (('id_pedido', 'id_producto'),)
        verbose_name = 'Detalle de Pedido'
        verbose_name_plural = 'Detalles de Pedido'

    def __str__(self):
        return f"Detalle Pedido {self.id} - Producto {self.id_producto.nombre if self.id_producto else 'N/A'}"

class DetalleVenta(models.Model):
    id_venta = models.ForeignKey('Ventas', models.CASCADE, db_column='id_venta', related_name='detalles_venta') # CASCADE
    id_producto = models.ForeignKey('Productos', models.SET_NULL, db_column='id_producto', blank=True, null=True)
    cantidad = models.DecimalField(max_digits=10, decimal_places=2)
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)
    subtotal = models.DecimalField(max_digits=10, decimal_places=2)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'detalle_venta'
        unique_together = (('id_venta', 'id_producto'),)
        verbose_name = 'Detalle de Venta'
        verbose_name_plural = 'Detalles de Venta'

    def __str__(self):
        return f"Detalle Venta {self.id} - Producto {self.id_producto.nombre if self.id_producto else 'N/A'}"

class Facturas(models.Model):
    id_pedido = models.OneToOneField('Pedidos', models.SET_NULL, db_column='id_pedido', blank=True, null=True)
    id_cliente = models.ForeignKey('Clientes', models.SET_NULL, db_column='id_cliente', blank=True, null=True)
    fecha_factura = models.DateTimeField(auto_now_add=True)
    total_factura = models.DecimalField(max_digits=10, decimal_places=2)
    estado = models.CharField(max_length=50, blank=True, null=True) # Ej: 'Pagada', 'Pendiente', 'Anulada'
    es_fiscal = models.BooleanField(default=False) # Nuevo: Para gestión fiscal/no fiscal
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'facturas'
        verbose_name = 'Factura'
        verbose_name_plural = 'Facturas'

    def __str__(self):
        return f"Factura {self.id}"

class DetalleFactura(models.Model):
    id_factura = models.ForeignKey('Facturas', models.CASCADE, db_column='id_factura', related_name='detalles_factura') # CASCADE
    id_producto = models.ForeignKey('Productos', models.SET_NULL, db_column='id_producto', blank=True, null=True)
    cantidad = models.DecimalField(max_digits=10, decimal_places=2)
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)
    subtotal = models.DecimalField(max_digits=10, decimal_places=2)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'detalle_factura'
        unique_together = (('id_factura', 'id_producto'),)
        verbose_name = 'Detalle de Factura'
        verbose_name_plural = 'Detalles de Factura'

    def __str__(self):
        return f"Detalle Factura {self.id} - Producto {self.id_producto.nombre if self.id_producto else 'N/A'}"

class RecibosPago(models.Model):
    id_factura = models.ForeignKey('Facturas', models.SET_NULL, db_column='id_factura', blank=True, null=True)
    id_metodo_pago = models.ForeignKey('MetodosPago', models.SET_NULL, db_column='id_metodo_pago', blank=True, null=True)
    monto_pago = models.DecimalField(max_digits=10, decimal_places=2)
    fecha_pago = models.DateTimeField(blank=True, null=True)
    estado = models.CharField(max_length=50, blank=True, null=True) # Ej: 'Pagado', 'Pendiente'
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'recibos_pago'
        verbose_name = 'Recibo de Pago'
        verbose_name_plural = 'Recibos de Pago'

    def __str__(self):
        return f"Recibo {self.id}"

class ComisionesEmpleados(models.Model):
    id_empleado = models.ForeignKey('Empleados', models.SET_NULL, db_column='id_empleado', blank=True, null=True)
    id_recibo_pago = models.ForeignKey('RecibosPago', models.SET_NULL, db_column='id_recibo_pago', blank=True, null=True)
    monto_comision = models.DecimalField(max_digits=10, decimal_places=2)
    fecha_comision = models.DateField(auto_now_add=True)
    estado = models.CharField(max_length=50, blank=True, null=True) # Ej: 'Pendiente', 'Pagada'
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'comisiones_empleados'
        verbose_name = 'Comisión de Empleado'
        verbose_name_plural = 'Comisiones de Empleados'

    def __str__(self):
        return f"Comisión {self.id} para {self.id_empleado.nombre if self.id_empleado else 'N/A'}"

class ComisionesPago(models.Model):
    nombre_comision = models.CharField(max_length=100)
    porcentaje = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    id_metodo_pago = models.ForeignKey('MetodosPago', models.SET_NULL, db_column='id_metodo_pago', blank=True, null=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'comisiones_pago'
        verbose_name = 'Comisión de Pago'
        verbose_name_plural = 'Comisiones de Pago'

    def __str__(self):
        return self.nombre_comision

class ComponentesProducto(models.Model):
    id_producto_principal = models.ForeignKey('Productos', models.CASCADE, db_column='id_producto_principal', related_name='componentes_principales')
    id_producto_componente = models.ForeignKey('Productos', models.CASCADE, db_column='id_producto_componente', related_name='componentes_secundarios')
    cantidad = models.DecimalField(max_digits=10, decimal_places=2)
    id_unidad_medida_componente = models.ForeignKey('UnidadesMedida', models.SET_NULL, db_column='id_unidad_medida_componente', blank=True, null=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'componentes_producto'
        verbose_name = 'Componente de Producto'
        verbose_name_plural = 'Componentes de Productos'

    def __str__(self):
        return f"Componente {self.id} de {self.id_producto_principal.nombre if self.id_producto_principal else 'N/A'}"

class Inventario(models.Model):
    id_producto = models.ForeignKey('Productos', models.CASCADE, db_column='id_producto')
    id_almacen = models.ForeignKey('Almacenes', models.CASCADE, db_column='id_almacen')
    cantidad_disponible = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    cantidad_minima = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    fecha_ultima_entrada = models.DateTimeField(blank=True, null=True)
    fecha_ultima_salida = models.DateTimeField(blank=True, null=True)
    # Nuevo: Para inventario fiscal/no fiscal
    es_fiscal = models.BooleanField(default=False)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'inventario'
        unique_together = (('id_producto', 'id_almacen', 'es_fiscal'),) # Unique por producto, almacén y tipo fiscal
        verbose_name = 'Inventario'
        verbose_name_plural = 'Inventario'

    def __str__(self):
        return f"Inventario {self.id_producto.nombre if self.id_producto else 'N/A'} en {self.id_almacen.nombre_almacen if self.id_almacen else 'N/A'} (Fiscal: {self.es_fiscal})"

class MetodosPago(models.Model):
    nombre_metodo = models.CharField(unique=True, max_length=100)
    descripcion = models.CharField(max_length=255, blank=True, null=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'metodos_pago'
        verbose_name = 'Método de Pago'
        verbose_name_plural = 'Métodos de Pago'

    def __str__(self):
        return self.nombre_metodo

class MovimientosInventario(models.Model):
    id_producto = models.ForeignKey('Productos', models.SET_NULL, db_column='id_producto', blank=True, null=True)
    id_almacen = models.ForeignKey('Almacenes', models.SET_NULL, db_column='id_almacen', blank=True, null=True)
    tipo_movimiento = models.CharField(max_length=50, blank=True, null=True) # Ej: 'Entrada', 'Salida', 'Ajuste'
    cantidad = models.DecimalField(max_digits=10, decimal_places=2)
    fecha_movimiento = models.DateTimeField(auto_now_add=True)
    id_usuario = models.ForeignKey('Usuarios', models.SET_NULL, db_column='id_usuario', blank=True, null=True)
    observaciones = models.TextField(blank=True, null=True)
    es_fiscal = models.BooleanField(default=False) # Nuevo: para movimientos fiscales/no fiscales
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'movimientos_inventario'
        verbose_name = 'Movimiento de Inventario'
        verbose_name_plural = 'Movimientos de Inventario'

    def __str__(self):
        return f"Movimiento {self.id} de {self.cantidad} de {self.id_producto.nombre if self.id_producto else 'N/A'}"

class TasasCambio(models.Model):
    id_moneda_origen = models.ForeignKey('Monedas', models.SET_NULL, db_column='id_moneda_origen', related_name='tasas_origen', blank=True, null=True)
    id_moneda_destino = models.ForeignKey('Monedas', models.SET_NULL, db_column='id_moneda_destino', related_name='tasas_destino', blank=True, null=True)
    tasa = models.DecimalField(max_digits=10, decimal_places=4)
    fecha_tasa = models.DateField(auto_now_add=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tasas_cambio'
        unique_together = (('id_moneda_origen', 'id_moneda_destino', 'fecha_tasa'),)
        verbose_name = 'Tasa de Cambio'
        verbose_name_plural = 'Tasas de Cambio'

    def __str__(self):
        return f"Tasa {self.tasa} ({self.id_moneda_origen} a {self.id_moneda_destino})"

class TransaccionesFinancieras(models.Model):
    TIPO_TRANSACCION_CHOICES = [
        ('INGRESO', 'Ingreso'),
        ('EGRESO', 'Egreso'),
        ('PRESTAMO', 'Préstamo'), # Nuevo tipo
        ('PAGO_PRESTAMO', 'Pago de Préstamo'), # Nuevo tipo
        ('COMPENSACION', 'Compensación'), # Nuevo tipo
    ]
    tipo_transaccion = models.CharField(max_length=50, choices=TIPO_TRANSACCION_CHOICES)
    monto = models.DecimalField(max_digits=10, decimal_places=2)
    fecha_transaccion = models.DateTimeField(auto_now_add=True)
    descripcion = models.TextField(blank=True, null=True)
    id_usuario = models.ForeignKey('Usuarios', models.SET_NULL, db_column='id_usuario', blank=True, null=True)
    id_documento_asociado = models.CharField(max_length=255, blank=True, null=True) # Para asociar a facturas, pedidos, etc.
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'transacciones_financieras'
        verbose_name = 'Transacción Financiera'
        verbose_name_plural = 'Transacciones Financieras'

    def __str__(self):
        return f"Transacción {self.tipo_transaccion} - {self.monto}"

class UnidadesEmpaqueProducto(models.Model):
    id_producto = models.ForeignKey('Productos', models.CASCADE, db_column='id_producto')
    id_unidad_medida = models.ForeignKey('UnidadesMedida', models.SET_NULL, db_column='id_unidad_medida', blank=True, null=True)
    cantidad_por_unidad = models.DecimalField(max_digits=10, decimal_places=2)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'unidades_empaque_producto'
        verbose_name = 'Unidad de Empaque de Producto'
        verbose_name_plural = 'Unidades de Empaque de Productos'

    def __str__(self):
        return f"Empaque {self.id} para {self.id_producto.nombre if self.id_producto else 'N/A'}"

class UsuarioRoles(models.Model):
    id_usuario = models.ForeignKey('Usuarios', models.CASCADE, db_column='id_usuario')
    id_rol = models.ForeignKey('Roles', models.CASCADE, db_column='id_rol')
    fecha_asignacion = models.DateField(auto_now_add=True)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'usuario_roles'
        unique_together = (('id_usuario', 'id_rol'),)
        verbose_name = 'Rol de Usuario'
        verbose_name_plural = 'Roles de Usuarios'

    def __str__(self):
        return f"Usuario {self.id_usuario.nombre_usuario if self.id_usuario else 'N/A'} - Rol {self.id_rol.nombre_rol if self.id_rol else 'N/A'}"

class VacacionesAusencias(models.Model):
    id_empleado = models.ForeignKey('Empleados', models.CASCADE, db_column='id_empleado')
    tipo_ausencia = models.CharField(max_length=50, blank=True, null=True) # Ej: 'Vacaciones', 'Enfermedad'
    fecha_inicio = models.DateField()
    fecha_fin = models.DateField()
    estado = models.CharField(max_length=50, blank=True, null=True) # Ej: 'Pendiente', 'Aprobada', 'Rechazada'
    observaciones = models.TextField(blank=True, null=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'vacaciones_ausencias'
        verbose_name = 'Vacación/Ausencia'
        verbose_name_plural = 'Vacaciones/Ausencias'

    def __str__(self):
        return f"Ausencia de {self.id_empleado.nombre if self.id_empleado else 'N/A'} ({self.tipo_ausencia})"

# --- Nuevos Modelos para Auditoría y Préstamos ---

class RegistroAuditoria(models.Model): # Nuevo modelo para el registro de cambios
    id_usuario = models.ForeignKey('Usuarios', models.SET_NULL, db_column='id_usuario', blank=True, null=True)
    accion = models.CharField(max_length=255) # Ej: 'CREATE', 'UPDATE', 'DELETE', 'LOGIN'
    modelo_afectado = models.CharField(max_length=100, blank=True, null=True) # Ej: 'Producto', 'Venta'
    id_objeto_afectado = models.CharField(max_length=255, blank=True, null=True) # ID del objeto afectado
    cambios_json = models.JSONField(blank=True, null=True) # Almacenar detalles del cambio en JSON
    fecha_accion = models.DateTimeField(auto_now_add=True)
    ip_address = models.GenericIPAddressField(blank=True, null=True)

    class Meta:
        db_table = 'registro_auditoria'
        verbose_name = 'Registro de Auditoría'
        verbose_name_plural = 'Registros de Auditoría'
        ordering = ['-fecha_accion'] # Ordenar por fecha descendente

    def __str__(self):
        return f"[{self.fecha_accion}] {self.id_usuario.nombre_usuario if self.id_usuario else 'N/A'} - {self.accion} en {self.modelo_afectado} ({self.id_objeto_afectado})"

class Prestamos(models.Model): # Nuevo modelo para préstamos
    TIPO_PRESTAMO_CHOICES = [
        ('EMPLEADO', 'A Empleado'),
        ('CLIENTE', 'A Cliente'),
    ]
    tipo_prestamo = models.CharField(max_length=50, choices=TIPO_PRESTAMO_CHOICES)
    id_empleado = models.ForeignKey('Empleados', models.SET_NULL, db_column='id_empleado', blank=True, null=True)
    id_cliente = models.ForeignKey('Clientes', models.SET_NULL, db_column='id_cliente', blank=True, null=True)
    monto_principal = models.DecimalField(max_digits=12, decimal_places=2)
    tasa_interes = models.DecimalField(max_digits=5, decimal_places=2) # Porcentaje
    plazo_meses = models.IntegerField()
    fecha_inicio = models.DateField(auto_now_add=True)
    fecha_fin_estimada = models.DateField(blank=True, null=True)
    frecuencia_pago = models.CharField(max_length=50) # Ej: 'Mensual', 'Quincenal'
    estado = models.CharField(max_length=50, default='ACTIVO') # Ej: 'ACTIVO', 'CANCELADO', 'ATRASADO'
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'prestamos'
        verbose_name = 'Préstamo'
        verbose_name_plural = 'Préstamos'

    def __str__(self):
        return f"Préstamo a {self.get_tipo_prestamo_display()} - {self.monto_principal}"

class CuotasPrestamo(models.Model): # Nuevo modelo para cuotas de préstamos
    id_prestamo = models.ForeignKey('Prestamos', models.CASCADE, db_column='id_prestamo', related_name='cuotas')
    numero_cuota = models.IntegerField()
    fecha_vencimiento = models.DateField()
    monto_capital = models.DecimalField(max_digits=10, decimal_places=2)
    monto_interes = models.DecimalField(max_digits=10, decimal_places=2)
    monto_total_cuota = models.DecimalField(max_digits=10, decimal_places=2)
    fecha_pago = models.DateField(blank=True, null=True)
    estado = models.CharField(max_length=50, default='PENDIENTE') # Ej: 'PENDIENTE', 'PAGADA', 'ATRASADA'
    id_transaccion_pago = models.OneToOneField('TransaccionesFinancieras', models.SET_NULL, db_column='id_transaccion_pago', blank=True, null=True) # Asociar a una transacción financiera de pago
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'cuotas_prestamo'
        unique_together = (('id_prestamo', 'numero_cuota'),)
        verbose_name = 'Cuota de Préstamo'
        verbose_name_plural = 'Cuotas de Préstamos'
        ordering = ['fecha_vencimiento', 'numero_cuota']

    def __str__(self):
        return f"Cuota {self.numero_cuota} de Préstamo {self.id_prestamo_id}"
