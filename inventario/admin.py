# inventario/admin.py

from django.contrib import admin
from .models import ( # ¡Importación desde la misma app!
    Almacenes, CategoriasProducto, Clientes, Empleados, Fabricantes,
    Monedas, Productos, Proveedores, Roles, UnidadesMedida, Usuarios,
    ComisionesEmpleados, ComisionesPago, ComponentesProducto, Facturas,
    Inventario, MetodosPago, MovimientosInventario, Pedidos, RecibosPago,
    TasasCambio, TransaccionesFinancieras, UnidadesEmpaqueProducto, UsuarioRoles,
    VacacionesAusencias, Ventas, DetalleFactura, DetallePedido, DetalleVenta,
    ListasPrecio, RegistroAuditoria, Prestamos, CuotasPrestamo
)

# Registra tus modelos aquí.
admin.site.register(Almacenes)
admin.site.register(CategoriasProducto)
admin.site.register(Clientes)
admin.site.register(Empleados)
admin.site.register(Fabricantes)
admin.site.register(Monedas)
admin.site.register(Productos)
admin.site.register(Proveedores)
admin.site.register(Roles)
admin.site.register(UnidadesMedida)
admin.site.register(Usuarios)
admin.site.register(ComisionesEmpleados)
admin.site.register(ComisionesPago)
admin.site.register(ComponentesProducto)
admin.site.register(Facturas)
admin.site.register(Inventario)
admin.site.register(MetodosPago)
admin.site.register(MovimientosInventario)
admin.site.register(Pedidos)
admin.site.register(RecibosPago)
admin.site.register(TasasCambio)
admin.site.register(TransaccionesFinancieras)
admin.site.register(UnidadesEmpaqueProducto)
admin.site.register(UsuarioRoles)
admin.site.register(VacacionesAusencias)
admin.site.register(Ventas)
admin.site.register(DetalleFactura)
admin.site.register(DetallePedido)
admin.site.register(DetalleVenta)
admin.site.register(ListasPrecio)
admin.site.register(RegistroAuditoria)
admin.site.register(Prestamos)
admin.site.register(CuotasPrestamo)
