# innovapos_backend/urls.py

from django.contrib import admin
from django.urls import path, include
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
from rest_framework import routers
from inventario import views # Importa las vistas de tu app original

# Crea un router para registrar tus ViewSets de forma automática
router = routers.DefaultRouter()

# Registra todos los ViewSets de tu aplicación inventario
router.register(r'almacenes', views.AlmacenesViewSet)
router.register(r'categorias', views.CategoriasProductoViewSet)
router.register(r'clientes', views.ClientesViewSet)
router.register(r'empleados', views.EmpleadosViewSet)
router.register(r'fabricantes', views.FabricantesViewSet)
router.register(r'monedas', views.MonedasViewSet)
router.register(r'productos', views.ProductosViewSet)
router.register(r'proveedores', views.ProveedoresViewSet)
router.register(r'roles', views.RolesViewSet)
router.register(r'unidades-medida', views.UnidadesMedidaViewSet)
router.register(r'usuarios', views.UsuariosViewSet)
router.register(r'comisiones-empleados', views.ComisionesEmpleadosViewSet)
# ¡Verifica esta línea! Debe ser 'ComisionesPagoViewSet'
router.register(r'comisiones-pago', views.ComisionesPagoViewSet)
router.register(r'componentes-producto', views.ComponentesProductoViewSet)
router.register(r'facturas', views.FacturasViewSet)
router.register(r'inventario', views.InventarioViewSet)
router.register(r'metodos-pago', views.MetodosPagoViewSet)
router.register(r'movimientos-inventario', views.MovimientosInventarioViewSet)
router.register(r'pedidos', views.PedidosViewSet)
router.register(r'recibos-pago', views.RecibosPagoViewSet)
router.register(r'tasas-cambio', views.TasasCambioViewSet)
router.register(r'transacciones-financieras', views.TransaccionesFinancierasViewSet)
router.register(r'unidades-empaque-producto', views.UnidadesEmpaqueProductoViewSet)
router.register(r'usuario-roles', views.UsuarioRolesViewSet)
router.register(r'vacaciones-ausencias', views.VacacionesAusenciasViewSet)
router.register(r'ventas', views.VentasViewSet)
router.register(r'detalle-factura', views.DetalleFacturaViewSet)
router.register(r'detalle-pedido', views.DetallePedidoViewSet)
router.register(r'detalle-venta', views.DetalleVentaViewSet)
router.register(r'listas-precio', views.ListasPrecioViewSet)
router.register(r'registro-auditoria', views.RegistroAuditoriaViewSet)
router.register(r'prestamos', views.PrestamosViewSet)
router.register(r'cuotas-prestamo', views.CuotasPrestamoViewSet)


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]