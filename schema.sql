--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Drop existing tables and sequences if they exist, in reverse order of creation (or use CASCADE)
-- This ensures a clean slate for each import attempt.
--

DROP TABLE IF EXISTS public.vacaciones_ausencias CASCADE;
DROP SEQUENCE IF EXISTS public.vacaciones_ausencias_id_vacacion_ausencia_seq CASCADE;
DROP TABLE IF EXISTS public.usuarios CASCADE;
DROP SEQUENCE IF EXISTS public.usuarios_id_usuario_seq CASCADE;
DROP TABLE IF EXISTS public.usuario_roles CASCADE;
DROP TABLE IF EXISTS public.unidades_medida CASCADE;
DROP SEQUENCE IF EXISTS public.unidades_medida_id_unidad_medida_seq CASCADE;
DROP TABLE IF EXISTS public.unidades_empaque_producto CASCADE;
DROP SEQUENCE IF EXISTS public.unidades_empaque_producto_id_unidad_empaque_producto_seq CASCADE;
DROP TABLE IF EXISTS public.transacciones_financieras CASCADE;
DROP SEQUENCE IF EXISTS public.transacciones_financieras_id_transaccion_seq CASCADE;
DROP TABLE IF EXISTS public.tasas_cambio CASCADE;
DROP SEQUENCE IF EXISTS public.tasas_cambio_id_tasa_cambio_seq CASCADE;
DROP TABLE IF EXISTS public.tarjetas_fidelizacion CASCADE;
DROP SEQUENCE IF EXISTS public.tarjetas_fidelizacion_id_tarjeta_seq CASCADE;
DROP TABLE IF EXISTS public.sucursales CASCADE;
DROP SEQUENCE IF EXISTS public.sucursales_id_sucursal_seq CASCADE;
DROP TABLE IF EXISTS public.roles CASCADE;
DROP SEQUENCE IF EXISTS public.roles_id_rol_seq CASCADE;
DROP TABLE IF EXISTS public.rol_permisos CASCADE;
DROP TABLE IF EXISTS public.registros_reloj CASCADE;
DROP SEQUENCE IF EXISTS public.registros_reloj_id_registro_reloj_seq CASCADE;
DROP TABLE IF EXISTS public.record_crediticio_cliente CASCADE;
DROP SEQUENCE IF EXISTS public.record_crediticio_cliente_id_record_seq CASCADE;
DROP TABLE IF EXISTS public.recibos_pago CASCADE;
DROP SEQUENCE IF EXISTS public.recibos_pago_id_recibo_pago_seq CASCADE;
DROP TABLE IF EXISTS public.recepciones_mercancia CASCADE;
DROP SEQUENCE IF EXISTS public.recepciones_mercancia_id_recepcion_seq CASCADE;
DROP TABLE IF EXISTS public.recepcion_mercancia_detalles CASCADE;
DROP SEQUENCE IF EXISTS public.recepcion_mercancia_detalles_id_detalle_recepcion_seq CASCADE;
DROP TABLE IF EXISTS public.proveedores CASCADE;
DROP SEQUENCE IF EXISTS public.proveedores_id_proveedor_seq CASCADE;
DROP TABLE IF EXISTS public.proveedor_fabricante CASCADE;
DROP TABLE IF EXISTS public.productos CASCADE;
DROP SEQUENCE IF EXISTS public.productos_id_producto_seq CASCADE;
DROP TABLE IF EXISTS public.producto_descuentos CASCADE;
DROP TABLE IF EXISTS public.precios_producto CASCADE;
DROP SEQUENCE IF EXISTS public.precios_producto_id_precio_producto_seq CASCADE;
DROP TABLE IF EXISTS public.permisos CASCADE;
DROP SEQUENCE IF EXISTS public.permisos_id_permiso_seq CASCADE;
DROP TABLE IF EXISTS public.pedidos CASCADE;
DROP SEQUENCE IF EXISTS public.pedidos_id_pedido_seq CASCADE;
DROP TABLE IF EXISTS public.pedido_impuestos_linea CASCADE;
DROP TABLE IF EXISTS public.pedido_detalles CASCADE;
DROP SEQUENCE IF EXISTS public.pedido_detalles_id_detalle_pedido_seq CASCADE;
DROP TABLE IF EXISTS public.pagos_recibidos CASCADE;
DROP SEQUENCE IF EXISTS public.pagos_recibidos_id_pago_seq CASCADE;
DROP TABLE IF EXISTS public.pagos_realizados CASCADE;
DROP SEQUENCE IF EXISTS public.pagos_realizados_id_pago_realizado_seq CASCADE;
DROP TABLE IF EXISTS public.ordenes_compra CASCADE;
DROP SEQUENCE IF EXISTS public.ordenes_compra_id_orden_compra_seq CASCADE;
DROP TABLE IF EXISTS public.orden_compra_impuestos_linea CASCADE;
DROP TABLE IF EXISTS public.orden_compra_detalles CASCADE;
DROP SEQUENCE IF EXISTS public.orden_compra_detalles_id_detalle_orden_compra_seq CASCADE;
DROP TABLE IF EXISTS public.operaciones_cambio_divisas CASCADE;
DROP SEQUENCE IF EXISTS public.operaciones_cambio_divisas_id_operacion_cambio_seq CASCADE;
DROP TABLE IF EXISTS public.opciones_metodo_pago CASCADE;
DROP SEQUENCE IF EXISTS public.opciones_metodo_pago_id_opcion_metodo_pago_seq CASCADE;
DROP TABLE IF EXISTS public.notas_entrega CASCADE;
DROP SEQUENCE IF EXISTS public.notas_entrega_id_nota_entrega_seq CASCADE;
DROP TABLE IF EXISTS public.notas_credito_interna CASCADE;
DROP SEQUENCE IF EXISTS public.notas_credito_interna_id_nota_credito_interna_seq CASCADE;
DROP TABLE IF EXISTS public.notas_credito_fiscal CASCADE;
DROP SEQUENCE IF EXISTS public.notas_credito_fiscal_id_nota_credito_fiscal_seq CASCADE;
DROP TABLE IF EXISTS public.nota_entrega_impuestos_linea CASCADE;
DROP TABLE IF EXISTS public.nota_entrega_detalles CASCADE;
DROP SEQUENCE IF EXISTS public.nota_entrega_detalles_id_detalle_nota_entrega_seq CASCADE;
DROP TABLE IF EXISTS public.movimientos_inventario CASCADE;
DROP SEQUENCE IF EXISTS public.movimientos_inventario_id_movimiento_seq CASCADE;
DROP TABLE IF EXISTS public.movimientos_caja CASCADE;
DROP SEQUENCE IF EXISTS public.movimientos_caja_id_movimiento_seq CASCADE;
DROP TABLE IF EXISTS public.monedas CASCADE;
DROP TABLE IF EXISTS public.metodos_pago CASCADE;
DROP SEQUENCE IF EXISTS public.metodos_pago_id_metodo_pago_seq CASCADE;
DROP TABLE IF EXISTS public.listas_precio CASCADE;
DROP SEQUENCE IF EXISTS public.listas_precio_id_lista_precio_seq CASCADE;
DROP TABLE IF EXISTS public.inventario_stock CASCADE;
DROP SEQUENCE IF EXISTS public.inventario_stock_id_inventario_stock_seq CASCADE;
DROP TABLE IF EXISTS public.inventario_rollos CASCADE;
DROP SEQUENCE IF EXISTS public.inventario_rollos_id_rollo_unico_seq CASCADE;
DROP TABLE IF EXISTS public.impuestos CASCADE;
DROP SEQUENCE IF EXISTS public.impuestos_id_impuesto_seq CASCADE;
DROP TABLE IF EXISTS public.gestiones_cobranza CASCADE;
DROP SEQUENCE IF EXISTS public.gestiones_cobranza_id_gestion_seq CASCADE;
DROP TABLE IF EXISTS public.gastos CASCADE;
DROP SEQUENCE IF EXISTS public.gastos_id_gasto_seq CASCADE;
DROP TABLE IF EXISTS public.facturas_proveedor CASCADE;
DROP SEQUENCE IF EXISTS public.facturas_proveedor_id_factura_proveedor_seq CASCADE;
DROP TABLE IF EXISTS public.facturas CASCADE;
DROP SEQUENCE IF EXISTS public.facturas_id_factura_seq CASCADE;
DROP TABLE IF EXISTS public.factura_proveedor_impuestos_linea CASCADE;
DROP TABLE IF EXISTS public.factura_proveedor_detalles CASCADE;
DROP SEQUENCE IF EXISTS public.factura_proveedor_detalles_id_detalle_factura_proveedor_seq CASCADE;
DROP TABLE IF EXISTS public.factura_impuestos_linea CASCADE;
DROP TABLE IF EXISTS public.factura_detalles CASCADE;
DROP SEQUENCE IF EXISTS public.factura_detalles_id_detalle_factura_seq CASCADE;
DROP TABLE IF EXISTS public.fabricantes CASCADE;
DROP SEQUENCE IF EXISTS public.fabricantes_id_fabricante_seq CASCADE;
DROP TABLE IF EXISTS public.extractos_bancarios CASCADE;
DROP SEQUENCE IF EXISTS public.extractos_bancarios_id_extracto_seq CASCADE;
DROP TABLE IF EXISTS public.extracto_detalles CASCADE;
DROP SEQUENCE IF EXISTS public.extracto_detalles_id_extracto_detalle_seq CASCADE;
DROP TABLE IF EXISTS public.empleados CASCADE;
DROP SEQUENCE IF EXISTS public.empleados_id_empleado_seq CASCADE;
DROP TABLE IF EXISTS public.direcciones_cliente CASCADE;
DROP SEQUENCE IF EXISTS public.direcciones_cliente_id_direccion_seq CASCADE;
DROP TABLE IF EXISTS public.descuentos_producto CASCADE;
DROP SEQUENCE IF EXISTS public.descuentos_producto_id_descuento_producto_seq CASCADE;
DROP TABLE IF EXISTS public.descuentos_globales CASCADE;
DROP SEQUENCE IF EXISTS public.descuentos_globales_id_descuento_global_seq CASCADE;
DROP TABLE IF EXISTS public.cuentas_por_pagar CASCADE;
DROP SEQUENCE IF EXISTS public.cuentas_por_pagar_id_cuenta_pagar_seq CASCADE;
DROP TABLE IF EXISTS public.cuentas_por_cobrar CASCADE;
DROP SEQUENCE IF EXISTS public.cuentas_por_cobrar_id_cuenta_cobrar_seq CASCADE;
DROP TABLE IF EXISTS public.cotizaciones CASCADE;
DROP SEQUENCE IF EXISTS public.cotizaciones_id_cotizacion_seq CASCADE;
DROP TABLE IF EXISTS public.cotizacion_impuestos_linea CASCADE;
DROP TABLE IF EXISTS public.cotizacion_detalles CASCADE;
DROP SEQUENCE IF EXISTS public.cotizacion_detalles_id_detalle_cotizacion_seq CASCADE;
DROP TABLE IF EXISTS public.contactos_cliente CASCADE;
DROP SEQUENCE IF EXISTS public.contactos_cliente_id_contacto_seq CASCADE;
DROP TABLE IF EXISTS public.componentes_producto CASCADE;
DROP SEQUENCE IF EXISTS public.componentes_producto_id_componente_producto_seq CASCADE;
DROP TABLE IF EXISTS public.comisiones_pago CASCADE;
DROP SEQUENCE IF EXISTS public.comisiones_pago_id_comision_pago_seq CASCADE;
DROP TABLE IF EXISTS public.comisiones_empleados CASCADE;
DROP SEQUENCE IF EXISTS public.comisiones_empleados_id_comision_seq CASCADE;
DROP TABLE IF EXISTS public.comisiones_aplicadas CASCADE;
DROP SEQUENCE IF EXISTS public.comisiones_aplicadas_id_comision_aplicada_seq CASCADE;
DROP TABLE IF EXISTS public.clientes CASCADE;
DROP SEQUENCE IF EXISTS public.clientes_id_cliente_seq CASCADE;
DROP TABLE IF EXISTS public.cierres_caja CASCADE;
DROP SEQUENCE IF EXISTS public.cierres_caja_id_cierre_caja_seq CASCADE;
DROP TABLE IF EXISTS public.categorias_producto CASCADE;
DROP SEQUENCE IF EXISTS public.categorias_producto_id_categoria_seq CASCADE;
DROP TABLE IF EXISTS public.categoria_descuentos CASCADE;
DROP TABLE IF EXISTS public.calculo_horas_trabajadas CASCADE;
DROP SEQUENCE IF EXISTS public.calculo_horas_trabajadas_id_calculo_seq CASCADE;
DROP TABLE IF EXISTS public.cajeros CASCADE;
DROP SEQUENCE IF EXISTS public.cajeros_id_cajero_seq CASCADE;
DROP TABLE IF EXISTS public.cajas CASCADE;
DROP SEQUENCE IF EXISTS public.cajas_id_caja_seq CASCADE;
DROP TABLE IF EXISTS public.bonificaciones_especiales CASCADE;
DROP SEQUENCE IF EXISTS public.bonificaciones_especiales_id_bonificacion_seq CASCADE;
DROP TABLE IF EXISTS public.bancos CASCADE;
DROP SEQUENCE IF EXISTS public.bancos_id_banco_seq CASCADE;
DROP TABLE IF EXISTS public.aplicacion_pagos_proveedor CASCADE;
DROP SEQUENCE IF EXISTS public.aplicacion_pagos_proveedor_id_aplicacion_pago_proveedor_seq CASCADE;
DROP TABLE IF EXISTS public.aplicacion_pagos CASCADE;
DROP SEQUENCE IF EXISTS public.aplicacion_pagos_id_aplicacion_pago_seq CASCADE;
DROP TABLE IF EXISTS public.aplicacion_nota_credito_interna CASCADE;
DROP SEQUENCE IF EXISTS public.aplicacion_nota_credito_interna_id_aplicacion_seq CASCADE;
DROP TABLE IF EXISTS public.almacenes CASCADE;
DROP SEQUENCE IF EXISTS public.almacenes_id_almacen_seq CASCADE;


--
-- Name: almacenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.almacenes (
    id_almacen integer NOT NULL,
    nombre_almacen character varying(100) NOT NULL,
    descripcion text,
    id_sucursal integer,
    es_almacen_principal_sucursal boolean DEFAULT false NOT NULL,
    es_almacen_principal_sistema boolean DEFAULT false NOT NULL,
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: almacenes_id_almacen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.almacenes_id_almacen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: almacenes_id_almacen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.almacenes_id_almacen_seq OWNED BY public.almacenes.id_almacen;


--
-- Name: aplicacion_nota_credito_interna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aplicacion_nota_credito_interna (
    id_aplicacion integer NOT NULL,
    id_nota_credito_interna integer NOT NULL,
    id_documento_destino integer NOT NULL,
    tipo_documento_destino character varying(50) NOT NULL,
    monto_aplicado numeric(18,2) NOT NULL,
    fecha_aplicacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_usuario_aplicacion integer NOT NULL
);


--
-- Name: aplicacion_nota_credito_interna_id_aplicacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aplicacion_nota_credito_interna_id_aplicacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: aplicacion_nota_credito_interna_id_aplicacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aplicacion_nota_credito_interna_id_aplicacion_seq OWNED BY public.aplicacion_nota_credito_interna.id_aplicacion;


--
-- Name: aplicacion_pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aplicacion_pagos (
    id_aplicacion_pago integer NOT NULL,
    id_pago integer NOT NULL,
    id_documento_afectado integer NOT NULL,
    tipo_documento_afectado character varying(50) NOT NULL,
    monto_aplicado numeric(18,2) NOT NULL,
    id_moneda_aplicacion character varying(3) NOT NULL,
    tasa_cambio_aplicacion numeric(18,8),
    fecha_aplicacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: aplicacion_pagos_id_aplicacion_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aplicacion_pagos_id_aplicacion_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: aplicacion_pagos_id_aplicacion_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aplicacion_pagos_id_aplicacion_pago_seq OWNED BY public.aplicacion_pagos.id_aplicacion_pago;


--
-- Name: aplicacion_pagos_proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aplicacion_pagos_proveedor (
    id_aplicacion_pago_proveedor integer NOT NULL,
    id_pago_realizado integer NOT NULL,
    id_factura_proveedor integer NOT NULL,
    monto_aplicado numeric(18,2) NOT NULL,
    id_moneda_aplicacion character varying(3) NOT NULL,
    tasa_cambio_aplicacion numeric(18,8),
    fecha_aplicacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: aplicacion_pagos_proveedor_id_aplicacion_pago_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aplicacion_pagos_proveedor_id_aplicacion_pago_proveedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: aplicacion_pagos_proveedor_id_aplicacion_pago_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aplicacion_pagos_proveedor_id_aplicacion_pago_proveedor_seq OWNED BY public.aplicacion_pagos_proveedor.id_aplicacion_pago_proveedor;


--
-- Name: bancos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bancos (
    id_banco integer NOT NULL,
    nombre_banco character varying(100) NOT NULL,
    numero_cuenta character varying(50) NOT NULL,
    tipo_cuenta character varying(50),
    id_moneda character varying(3) NOT NULL,
    saldo_actual numeric(18,2) DEFAULT 0 NOT NULL,
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: bancos_id_banco_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bancos_id_banco_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bancos_id_banco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bancos_id_banco_seq OWNED BY public.bancos.id_banco;


--
-- Name: bonificaciones_especiales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bonificaciones_especiales (
    id_bonificacion integer NOT NULL,
    id_empleado integer NOT NULL,
    fecha_bonificacion date NOT NULL,
    monto numeric(18,2) NOT NULL,
    id_moneda_bonificacion character varying(3) NOT NULL,
    concepto text NOT NULL,
    id_recibo_pago integer,
    estado_pago character varying(50) NOT NULL,
    id_transaccion_pago integer
);


--
-- Name: bonificaciones_especiales_id_bonificacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bonificaciones_especiales_id_bonificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bonificaciones_especiales_id_bonificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bonificaciones_especiales_id_bonificacion_seq OWNED BY public.bonificaciones_especiales.id_bonificacion;


--
-- Name: cajas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cajas (
    id_caja integer NOT NULL,
    nombre_caja character varying(100) NOT NULL,
    id_sucursal integer,
    id_moneda character varying(3) NOT NULL,
    saldo_actual numeric(18,2) DEFAULT 0 NOT NULL,
    es_caja_pos_temporal boolean DEFAULT false NOT NULL,
    id_cajero_asociado integer,
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: cajas_id_caja_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cajas_id_caja_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cajas_id_caja_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cajas_id_caja_seq OWNED BY public.cajas.id_caja;


--
-- Name: cajeros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cajeros (
    id_cajero integer NOT NULL,
    id_usuario integer NOT NULL,
    id_sucursal integer NOT NULL,
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: cajeros_id_cajero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cajeros_id_cajero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cajeros_id_cajero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cajeros_id_cajero_seq OWNED BY public.cajeros.id_cajero;


--
-- Name: calculo_horas_trabajadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calculo_horas_trabajadas (
    id_calculo integer NOT NULL,
    id_empleado integer NOT NULL,
    fecha_inicio_periodo date NOT NULL,
    fecha_fin_periodo date NOT NULL,
    horas_ordinarias numeric(10,2) DEFAULT 0 NOT NULL,
    horas_extras_diurnas numeric(10,2) DEFAULT 0 NOT NULL,
    horas_extras_nocturnas numeric(10,2) DEFAULT 0 NOT NULL,
    horas_feriado numeric(10,2) DEFAULT 0 NOT NULL,
    monto_horas_extras numeric(18,2) DEFAULT 0 NOT NULL,
    id_moneda_calculo character varying(3) NOT NULL,
    estado_calculo character varying(50) DEFAULT 'Pendiente'::character varying NOT NULL,
    id_recibo_pago integer,
    fecha_calculo timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_usuario_calculo integer NOT NULL,
    notas text
);


--
-- Name: calculo_horas_trabajadas_id_calculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calculo_horas_trabajadas_id_calculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: calculo_horas_trabajadas_id_calculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calculo_horas_trabajadas_id_calculo_seq OWNED BY public.calculo_horas_trabajadas.id_calculo;


--
-- Name: categoria_descuentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria_descuentos (
    id_categoria integer NOT NULL,
    id_descuento_producto integer NOT NULL
);


--
-- Name: categorias_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias_producto (
    id_categoria integer NOT NULL,
    nombre_categoria character varying(100) NOT NULL,
    id_categoria_padre integer,
    descripcion text,
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: categorias_producto_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_producto_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categorias_producto_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_producto_id_categoria_seq OWNED BY public.categorias_producto.id_categoria;


--
-- Name: cierres_caja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cierres_caja (
    id_cierre_caja integer NOT NULL,
    id_sucursal integer NOT NULL,
    id_cajero integer NOT NULL,
    fecha_apertura timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_cierre timestamp without time zone,
    monto_apertura_efectivo numeric(18,2) NOT NULL,
    monto_cierre_efectivo_declarado numeric(18,2),
    monto_cierre_efectivo_contado numeric(18,2),
    diferencia_efectivo numeric(18,2),
    total_ventas_declaradas numeric(18,2),
    total_efectivo_ingresado numeric(18,2),
    total_efectivo_egresado numeric(18,2),
    estado character varying(50) NOT NULL,
    notas text
);


--
-- Name: cierres_caja_id_cierre_caja_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cierres_caja_id_cierre_caja_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cierres_caja_id_cierre_caja_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cierres_caja_id_cierre_caja_seq OWNED BY public.cierres_caja.id_cierre_caja;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    tipo_documento character varying(1) NOT NULL,
    numero_documento character varying(20) NOT NULL,
    nombre_razon_social character varying(255) NOT NULL,
    telefono_principal character varying(20),
    email_principal character varying(100),
    id_lista_precio_default integer,
    credito_autorizado boolean DEFAULT false NOT NULL,
    monto_credito_maximo numeric(18,2),
    dias_credito integer,
    activo boolean DEFAULT true NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: clientes_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clientes_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;


--
-- Name: comisiones_aplicadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comisiones_aplicadas (
    id_comision_aplicada integer NOT NULL,
    id_transaccion_financiera integer NOT NULL,
    id_metodo_pago integer NOT NULL,
    monto_comision numeric(18,2) NOT NULL,
    id_moneda_comision character varying(3) NOT NULL,
    concepto text NOT NULL,
    fecha_aplicacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: comisiones_aplicadas_id_comision_aplicada_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comisiones_aplicadas_id_comision_aplicada_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comisiones_aplicadas_id_comision_aplicada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comisiones_aplicadas_id_comision_aplicada_seq OWNED BY public.comisiones_aplicadas.id_comision_aplicada;


--
-- Name: comisiones_empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comisiones_empleados (
    id_comision integer NOT NULL,
    id_empleado integer NOT NULL,
    fecha_comision date NOT NULL,
    tipo_comision character varying(50) NOT NULL,
    monto_calculado numeric(18,2) NOT NULL,
    id_moneda_comision character varying(3) NOT NULL,
    porcentaje_aplicado numeric(5,2),
    referencia_documento character varying(255),
    estado_pago character varying(50) NOT NULL,
    id_recibo_pago integer,
    notas text
);


--
-- Name: comisiones_empleados_id_comision_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comisiones_empleados_id_comision_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comisiones_empleados_id_comision_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comisiones_empleados_id_comision_seq OWNED BY public.comisiones_empleados.id_comision;


--
-- Name: comisiones_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comisiones_pago (
    id_comision_pago integer NOT NULL,
    id_metodo_pago integer NOT NULL,
    tipo_operacion character varying(20) NOT NULL,
    porcentaje numeric(5,2),
    monto_fijo numeric(18,2),
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: comisiones_pago_id_comision_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comisiones_pago_id_comision_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comisiones_pago_id_comision_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comisiones_pago_id_comision_pago_seq OWNED BY public.comisiones_pago.id_comision_pago;


--
-- Name: componentes_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.componentes_producto (
    id_componente_producto integer NOT NULL,
    id_producto_principal integer NOT NULL,
    id_producto_componente integer NOT NULL,
    cantidad numeric(18,4) NOT NULL,
    id_unidad_medida_componente integer
);


--
-- Name: componentes_producto_id_componente_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.componentes_producto_id_componente_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: componentes_producto_id_componente_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.componentes_producto_id_componente_producto_seq OWNED BY public.componentes_producto.id_componente_producto;


--
-- Name: contactos_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contactos_cliente (
    id_contacto integer NOT NULL,
    id_cliente integer NOT NULL,
    tipo_contacto character varying(50) NOT NULL,
    nombre_contacto character varying(100) NOT NULL,
    telefono_contacto character varying(20),
    email_contacto character varying(100),
    cargo character varying(100)
);


--
-- Name: contactos_cliente_id_contacto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contactos_cliente_id_contacto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contactos_cliente_id_contacto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contactos_cliente_id_contacto_seq OWNED BY public.contactos_cliente.id_contacto;


--
-- Name: cotizacion_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cotizacion_detalles (
    id_detalle_cotizacion integer NOT NULL,
    id_cotizacion integer NOT NULL,
    id_producto integer NOT NULL,
    nombre_producto_snapshot character varying(255) NOT NULL,
    cantidad numeric(18,4) NOT NULL,
    id_unidad_empaque_usada integer,
    cantidad_empaque numeric(18,4),
    cantidad_rollos numeric(18,4),
    total_metros numeric(18,4),
    precio_unitario numeric(18,4) NOT NULL,
    descuento_linea numeric(18,2) DEFAULT 0 NOT NULL,
    impuesto_linea numeric(18,2) NOT NULL,
    subtotal_linea numeric(18,2) NOT NULL
);


--
-- Name: cotizacion_detalles_id_detalle_cotizacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cotizacion_detalles_id_detalle_cotizacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cotizacion_detalles_id_detalle_cotizacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cotizacion_detalles_id_detalle_cotizacion_seq OWNED BY public.cotizacion_detalles.id_detalle_cotizacion;


--
-- Name: cotizacion_impuestos_linea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cotizacion_impuestos_linea (
    id_detalle_cotizacion integer NOT NULL,
    id_impuesto integer NOT NULL,
    monto_impuesto numeric(18,2) NOT NULL
);


--
-- Name: cotizaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cotizaciones (
    id_cotizacion integer NOT NULL,
    id_cliente integer NOT NULL,
    id_usuario_creacion integer NOT NULL,
    fecha_cotizacion date DEFAULT CURRENT_DATE NOT NULL,
    fecha_vencimiento date,
    estado character varying(50) NOT NULL,
    id_moneda_cotizacion character varying(3) NOT NULL,
    tasa_cambio_base numeric(18,8) NOT NULL,
    subtotal numeric(18,2) NOT NULL,
    descuento_global numeric(18,2) DEFAULT 0 NOT NULL,
    impuesto_total numeric(18,2) NOT NULL,
    total_cotizacion numeric(18,2) NOT NULL,
    notas text
);


--
-- Name: cotizaciones_id_cotizacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cotizaciones_id_cotizacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cotizaciones_id_cotizacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cotizaciones_id_cotizacion_seq OWNED BY public.cotizaciones.id_cotizacion;


--
-- Name: cuentas_por_cobrar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas_por_cobrar (
    id_cuenta_cobrar integer NOT NULL,
    id_documento_origen integer NOT NULL,
    tipo_documento_origen character varying(50) NOT NULL,
    id_cliente integer NOT NULL,
    fecha_emision date NOT NULL,
    fecha_vencimiento date,
    monto_original numeric(18,2) NOT NULL,
    monto_pendiente numeric(18,2) NOT NULL,
    id_moneda character varying(3) NOT NULL,
    dias_mora integer,
    estado_cobranza character varying(50) NOT NULL,
    ultima_actualizacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: cuentas_por_cobrar_id_cuenta_cobrar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuentas_por_cobrar_id_cuenta_cobrar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cuentas_por_cobrar_id_cuenta_cobrar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuentas_por_cobrar_id_cuenta_cobrar_seq OWNED BY public.cuentas_por_cobrar.id_cuenta_cobrar;


--
-- Name: cuentas_por_pagar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas_por_pagar (
    id_cuenta_pagar integer NOT NULL,
    id_factura_proveedor integer NOT NULL,
    id_proveedor integer NOT NULL,
    fecha_emision date NOT NULL,
    fecha_vencimiento date,
    monto_original numeric(18,2) NOT NULL,
    monto_pendiente numeric(18,2) NOT NULL,
    id_moneda character varying(3) NOT NULL,
    dias_mora integer,
    estado_pago character varying(50) NOT NULL,
    ultima_actualizacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: cuentas_por_pagar_id_cuenta_pagar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuentas_por_pagar_id_cuenta_pagar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cuentas_por_pagar_id_cuenta_pagar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuentas_por_pagar_id_cuenta_pagar_seq OWNED BY public.cuentas_por_pagar.id_cuenta_pagar;


--
-- Name: descuentos_globales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.descuentos_globales (
    id_descuento_global integer NOT NULL,
    tipo_descuento character varying(50) NOT NULL,
    valor numeric(5,2) NOT NULL,
    es_porcentaje boolean DEFAULT true NOT NULL,
    condicion_minima_volumen numeric(18,2),
    id_metodo_pago integer,
    id_moneda_pago character varying(3),
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: descuentos_globales_id_descuento_global_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.descuentos_globales_id_descuento_global_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: descuentos_globales_id_descuento_global_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.descuentos_globales_id_descuento_global_seq OWNED BY public.descuentos_globales.id_descuento_global;


--
-- Name: descuentos_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.descuentos_producto (
    id_descuento_producto integer NOT NULL,
    nombre_descuento character varying(100) NOT NULL,
    tipo_descuento character varying(50) NOT NULL,
    valor_descuento numeric(5,2) NOT NULL,
    fecha_inicio_vigencia timestamp without time zone NOT NULL,
    fecha_fin_vigencia timestamp without time zone,
    condicion_cantidad_minima integer,
    activo boolean DEFAULT true NOT NULL,
    descripcion text
);


--
-- Name: descuentos_producto_id_descuento_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.descuentos_producto_id_descuento_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: descuentos_producto_id_descuento_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.descuentos_producto_id_descuento_producto_seq OWNED BY public.descuentos_producto.id_descuento_producto;


--
-- Name: direcciones_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.direcciones_cliente (
    id_direccion integer NOT NULL,
    id_cliente integer NOT NULL,
    nombre_direccion character varying(100),
    es_direccion_principal boolean DEFAULT false NOT NULL,
    pais character varying(100) NOT NULL,
    estado character varying(100) NOT NULL,
    municipio character varying(100) NOT NULL,
    parroquia character varying(100) NOT NULL,
    tipo_via character varying(50) NOT NULL,
    nombre_via character varying(100) NOT NULL,
    numero_via_nombre_edificacion character varying(100) NOT NULL,
    tipo_edificacion character varying(50),
    piso character varying(20),
    numero_inmueble character varying(50),
    enlace_gps text,
    fotos_inmueble text[]
);


--
-- Name: direcciones_cliente_id_direccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.direcciones_cliente_id_direccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: direcciones_cliente_id_direccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.direcciones_cliente_id_direccion_seq OWNED BY public.direcciones_cliente.id_direccion;

--
-- Name: empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados (
    id_empleado integer NOT NULL,
    id_usuario integer,
    primer_nombre character varying(100) NOT NULL,
    segundo_nombre character varying(100),
    primer_apellido character varying(100) NOT NULL,
    segundo_apellido character varying(100),
    cedula character varying(20) NOT NULL,
    fecha_nacimiento date,
    genero character varying(10),
    direccion text,
    telefono_personal character varying(20),
    email_personal character varying(100),
    fecha_ingreso date NOT NULL,
    fecha_egreso date,
    cargo character varying(100) NOT NULL,
    id_sucursal_asignada integer,
    salario_base numeric(18,2) NOT NULL,
    id_moneda_salario character varying(3) NOT NULL,
    frecuencia_pago character varying(50) NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    sueldo_por_hora numeric(18,4),
    jornada_horas_diarias numeric(4,2),
    jornada_dias_semanales integer,
    aplica_horas_extras boolean DEFAULT false NOT NULL
);


--
-- Name: empleados_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleados_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: empleados_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleados_id_empleado_seq OWNED BY public.empleados.id_empleado;


--
-- Name: extracto_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extracto_detalles (
    id_extracto_detalle integer NOT NULL,
    id_extracto integer NOT NULL,
    fecha_movimiento date NOT NULL,
    descripcion text NOT NULL,
    referencia_banco character varying(100),
    monto numeric(18,2) NOT NULL,
    tipo_movimiento character varying(20) NOT NULL,
    saldo_despues_movimiento numeric(18,2),
    es_conciliado boolean DEFAULT false NOT NULL,
    id_transaccion_conciliada integer
);


--
-- Name: extracto_detalles_id_extracto_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.extracto_detalles_id_extracto_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: extracto_detalles_id_extracto_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.extracto_detalles_id_extracto_detalle_seq OWNED BY public.extracto_detalles.id_extracto_detalle;


--
-- Name: extractos_bancarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extractos_bancarios (
    id_extracto integer NOT NULL,
    id_banco integer NOT NULL,
    fecha_importacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre_archivo character varying(255) NOT NULL,
    tipo_archivo character varying(10) NOT NULL,
    periodo_inicio date NOT NULL,
    periodo_fin date NOT NULL,
    total_debitos numeric(18,2),
    total_creditos numeric(18,2)
);


--
-- Name: extractos_bancarios_id_extracto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.extractos_bancarios_id_extracto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: extractos_bancarios_id_extracto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.extractos_bancarios_id_extracto_seq OWNED BY public.extractos_bancarios.id_extracto;


--
-- Name: fabricantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fabricantes (
    id_fabricante integer NOT NULL,
    nombre_fabricante character varying(100) NOT NULL,
    pais_origen character varying(100),
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: fabricantes_id_fabricante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fabricantes_id_fabricante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fabricantes_id_fabricante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fabricantes_id_fabricante_seq OWNED BY public.fabricantes.id_fabricante;


--
-- Name: factura_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura_detalles (
    id_detalle_factura integer NOT NULL,
    id_factura integer NOT NULL,
    id_producto integer NOT NULL,
    nombre_producto_snapshot character varying(255) NOT NULL,
    cantidad numeric(18,4) NOT NULL,
    id_unidad_empaque_usada integer,
    cantidad_empaque numeric(18,4),
    cantidad_rollos numeric(18,4),
    total_metros numeric(18,4),
    precio_unitario numeric(18,4) NOT NULL,
    descuento_linea numeric(18,2) DEFAULT 0 NOT NULL,
    impuesto_linea numeric(18,2) NOT NULL,
    subtotal_linea numeric(18,2) NOT NULL
);


--
-- Name: factura_detalles_id_detalle_factura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_detalles_id_detalle_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factura_detalles_id_detalle_factura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factura_detalles_id_detalle_factura_seq OWNED BY public.factura_detalles.id_detalle_factura;


--
-- Name: factura_impuestos_linea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura_impuestos_linea (
    id_detalle_factura integer NOT NULL,
    id_impuesto integer NOT NULL,
    monto_impuesto numeric(18,2) NOT NULL
);


--
-- Name: factura_proveedor_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura_proveedor_detalles (
    id_detalle_factura_proveedor integer NOT NULL,
    id_factura_proveedor integer NOT NULL,
    id_producto integer NOT NULL,
    nombre_producto_snapshot character varying(255) NOT NULL,
    cantidad numeric(18,4) NOT NULL,
    id_unidad_empaque_usada integer,
    cantidad_empaque numeric(18,4),
    cantidad_rollos numeric(18,4),
    total_metros numeric(18,4),
    costo_unitario numeric(18,4) NOT NULL,
    descuento_linea numeric(18,2) DEFAULT 0 NOT NULL,
    impuesto_linea numeric(18,2) NOT NULL,
    subtotal_linea numeric(18,2) NOT NULL
);


--
-- Name: factura_proveedor_detalles_id_detalle_factura_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_proveedor_detalles_id_detalle_factura_proveedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factura_proveedor_detalles_id_detalle_factura_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factura_proveedor_detalles_id_detalle_factura_proveedor_seq OWNED BY public.factura_proveedor_detalles.id_detalle_factura_proveedor;


--
-- Name: factura_proveedor_impuestos_linea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura_proveedor_impuestos_linea (
    id_detalle_factura_proveedor integer NOT NULL,
    id_impuesto integer NOT NULL,
    monto_impuesto numeric(18,2) NOT NULL
);


--
-- Name: facturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturas (
    id_factura integer NOT NULL,
    numero_factura character varying(50) NOT NULL,
    id_nota_entrega integer,
    id_cliente integer NOT NULL,
    id_sucursal integer NOT NULL,
    id_usuario_creacion integer NOT NULL,
    fecha_emision date DEFAULT CURRENT_DATE NOT NULL,
    fecha_vencimiento date,
    estado character varying(50) NOT NULL,
    id_moneda_factura character varying(3) NOT NULL,
    tasa_cambio_base numeric(18,8) NOT NULL,
    subtotal numeric(18,2) NOT NULL,
    descuento_global numeric(18,2) DEFAULT 0 NOT NULL,
    impuesto_total numeric(18,2) NOT NULL,
    total_factura numeric(18,2) NOT NULL,
    es_a_credito boolean DEFAULT false NOT NULL,
    monto_pendiente_cobro numeric(18,2) NOT NULL,
    notas text,
    ultima_modificacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_cierre_caja integer
);


--
-- Name: facturas_id_factura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturas_id_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: facturas_id_factura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturas_id_factura_seq OWNED BY public.facturas.id_factura;


--
-- Name: facturas_proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturas_proveedor (
    id_factura_proveedor integer NOT NULL,
    numero_factura_proveedor character varying(100) NOT NULL,
    id_proveedor integer NOT NULL,
    id_orden_compra integer,
    id_recepcion integer,
    id_usuario_registro integer NOT NULL,
    fecha_emision date NOT NULL,
    fecha_vencimiento date,
    id_moneda_factura character varying(3) NOT NULL,
    tasa_cambio_base numeric(18,8) NOT NULL,
    subtotal numeric(18,2) NOT NULL,
    descuento_global numeric(18,2) DEFAULT 0 NOT NULL,
    impuesto_total numeric(18,2) NOT NULL,
    total_factura numeric(18,2) NOT NULL,
    monto_pendiente_pago numeric(18,2) NOT NULL,
    estado character varying(50) NOT NULL,
    notas text,
    ultima_modificacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: facturas_proveedor_id_factura_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturas_proveedor_id_factura_proveedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: facturas_proveedor_id_factura_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturas_proveedor_id_factura_proveedor_seq OWNED BY public.facturas_proveedor.id_factura_proveedor;


--
-- Name: gastos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gastos (
    id_gasto integer NOT NULL,
    fecha_gasto date DEFAULT CURRENT_DATE NOT NULL,
    concepto text NOT NULL,
    monto numeric(18,2) NOT NULL,
    id_moneda character varying(3) NOT NULL,
    id_usuario_registro integer NOT NULL,
    id_metodo_pago integer,
    referencia_pago character varying(100),
    id_transaccion_financiera integer,
    notas text,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: gastos_id_gasto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gastos_id_gasto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gastos_id_gasto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gastos_id_gasto_seq OWNED BY public.gastos.id_gasto;


--
-- Name: gestiones_cobranza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gestiones_cobranza (
    id_gestion integer NOT NULL,
    id_cuenta_cobrar integer NOT NULL,
    id_usuario_gestion integer NOT NULL,
    fecha_gestion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tipo_gestion character varying(50) NOT NULL,
    resultado_gestion text,
    proximo_paso text,
    fecha_proximo_paso date
);


--
-- Name: gestiones_cobranza_id_gestion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gestiones_cobranza_id_gestion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gestiones_cobranza_id_gestion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gestiones_cobranza_id_gestion_seq OWNED BY public.gestiones_cobranza.id_gestion;


--
-- Name: impuestos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.impuestos (
    id_impuesto integer NOT NULL,
    nombre_impuesto character varying(100) NOT NULL,
    porcentaje numeric(5,2),
    es_porcentaje boolean DEFAULT true NOT NULL,
    monto_fijo numeric(18,2),
    tipo_aplicacion character varying(50) NOT NULL,
    aplica_a_monedas character varying(255),
    es_opcional boolean DEFAULT false NOT NULL,
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: impuestos_id_impuesto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.impuestos_id_impuesto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: impuestos_id_impuesto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.impuestos_id_impuesto_seq OWNED BY public.impuestos.id_impuesto;


--
-- Name: inventario_rollos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario_rollos (
    id_rollo_unico integer NOT NULL,
    id_producto integer NOT NULL,
    id_almacen integer NOT NULL,
    metraje_inicial numeric(18,4) NOT NULL,
    metraje_actual numeric(18,4) NOT NULL,
    fecha_ingreso timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    en_uso boolean DEFAULT false NOT NULL,
    estado character varying(50) DEFAULT 'Disponible'::character varying NOT NULL
);


--
-- Name: inventario_rollos_id_rollo_unico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventario_rollos_id_rollo_unico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventario_rollos_id_rollo_unico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventario_rollos_id_rollo_unico_seq OWNED BY public.inventario_rollos.id_rollo_unico;


--
-- Name: inventario_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario_stock (
    id_inventario_stock integer NOT NULL,
    id_producto integer NOT NULL,
    id_almacen integer NOT NULL,
    stock_actual numeric(18,4) DEFAULT 0 NOT NULL,
    stock_comprometido numeric(18,4) DEFAULT 0 NOT NULL,
    stock_minimo numeric(18,4),
    stock_maximo numeric(18,4)
);


--
-- Name: inventario_stock_id_inventario_stock_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventario_stock_id_inventario_stock_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventario_stock_id_inventario_stock_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventario_stock_id_inventario_stock_seq OWNED BY public.inventario_stock.id_inventario_stock;


--
-- Name: listas_precio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.listas_precio (
    id_lista_precio integer NOT NULL,
    nombre_lista character varying(100) NOT NULL,
    descripcion text,
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: listas_precio_id_lista_precio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.listas_precio_id_lista_precio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listas_precio_id_lista_precio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.listas_precio_id_lista_precio_seq OWNED BY public.listas_precio.id_lista_precio;


--
-- Name: metodos_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metodos_pago (
    id_metodo_pago integer NOT NULL,
    nombre_metodo character varying(100) NOT NULL,
    requiere_opcion boolean DEFAULT false NOT NULL,
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: metodos_pago_id_metodo_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metodos_pago_id_metodo_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metodos_pago_id_metodo_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metodos_pago_id_metodo_pago_seq OWNED BY public.metodos_pago.id_metodo_pago;


--
-- Name: monedas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monedas (
    id_moneda character varying(3) NOT NULL,
    nombre_moneda character varying(50) NOT NULL,
    simbolo character varying(5) NOT NULL,
    decimales integer DEFAULT 2 NOT NULL,
    es_moneda_principal boolean DEFAULT false NOT NULL
);


--
-- Name: movimientos_caja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimientos_caja (
    id_movimiento integer NOT NULL,
    id_cierre_caja integer NOT NULL,
    id_usuario_registro integer NOT NULL,
    fecha_movimiento timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tipo_movimiento character varying(50) NOT NULL,
    monto numeric(18,2) NOT NULL,
    id_moneda character varying(3) NOT NULL,
    concepto text NOT NULL,
    referencia_documento character varying(100)
);


--
-- Name: movimientos_caja_id_movimiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movimientos_caja_id_movimiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: movimientos_caja_id_movimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movimientos_caja_id_movimiento_seq OWNED BY public.movimientos_caja.id_movimiento;


--
-- Name: movimientos_inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimientos_inventario (
    id_movimiento integer NOT NULL,
    id_producto integer NOT NULL,
    id_almacen_origen integer,
    id_almacen_destino integer,
    tipo_movimiento character varying(50) NOT NULL,
    cantidad numeric(18,4) NOT NULL,
    id_unidad_empaque_original integer,
    cantidad_empaque_original numeric(18,4),
    id_rollo_unico integer,
    id_documento_origen character varying(255),
    tipo_documento_origen character varying(50),
    fecha_movimiento timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_usuario_responsable integer NOT NULL,
    motivo text,
    es_fiscal boolean DEFAULT false NOT NULL
);


--
-- Name: movimientos_inventario_id_movimiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movimientos_inventario_id_movimiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: movimientos_inventario_id_movimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movimientos_inventario_id_movimiento_seq OWNED BY public.movimientos_inventario.id_movimiento;


--
-- Name: nota_entrega_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nota_entrega_detalles (
    id_detalle_nota_entrega integer NOT NULL,
    id_nota_entrega integer NOT NULL,
    id_producto integer NOT NULL,
    nombre_producto_snapshot character varying(255) NOT NULL,
    cantidad_entregada numeric(18,4) NOT NULL,
    id_unidad_empaque_usada integer,
    cantidad_empaque numeric(18,4),
    cantidad_rollos numeric(18,4),
    total_metros numeric(18,4),
    id_almacen_salida integer NOT NULL,
    id_rollo_unico integer,
    precio_unitario numeric(18,4) NOT NULL,
    descuento_linea numeric(18,2) DEFAULT 0 NOT NULL,
    impuesto_linea numeric(18,2) NOT NULL,
    subtotal_linea numeric(18,2) NOT NULL
);


--
-- Name: nota_entrega_detalles_id_detalle_nota_entrega_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nota_entrega_detalles_id_detalle_nota_entrega_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nota_entrega_detalles_id_detalle_nota_entrega_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nota_entrega_detalles_id_detalle_nota_entrega_seq OWNED BY public.nota_entrega_detalles.id_detalle_nota_entrega;


--
-- Name: nota_entrega_impuestos_linea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nota_entrega_impuestos_linea (
    id_detalle_nota_entrega integer NOT NULL,
    id_impuesto integer NOT NULL,
    monto_impuesto numeric(18,2) NOT NULL
);


--
-- Name: notas_credito_fiscal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notas_credito_fiscal (
    id_nota_credito_fiscal integer NOT NULL,
    numero_nota_credito character varying(50) NOT NULL,
    id_factura_origen integer NOT NULL,
    id_cliente integer NOT NULL,
    id_usuario_creacion integer NOT NULL,
    fecha_emision date DEFAULT CURRENT_DATE NOT NULL,
    id_moneda character varying(3) NOT NULL,
    tasa_cambio_base numeric(18,8) NOT NULL,
    monto_afectado numeric(18,2) NOT NULL,
    motivo text,
    ultima_modificacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: notas_credito_fiscal_id_nota_credito_fiscal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notas_credito_fiscal_id_nota_credito_fiscal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notas_credito_fiscal_id_nota_credito_fiscal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notas_credito_fiscal_id_nota_credito_fiscal_seq OWNED BY public.notas_credito_fiscal.id_nota_credito_fiscal;


--
-- Name: notas_credito_interna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notas_credito_interna (
    id_nota_credito_interna integer NOT NULL,
    numero_nota_credito character varying(50) NOT NULL,
    id_documento_origen character varying(50),
    tipo_documento_origen character varying(50),
    id_cliente integer NOT NULL,
    id_usuario_creacion integer NOT NULL,
    fecha_emision date DEFAULT CURRENT_DATE NOT NULL,
    id_moneda character varying(3) NOT NULL,
    tasa_cambio_base numeric(18,8) NOT NULL,
    monto_afectado numeric(18,2) NOT NULL,
    monto_disponible numeric(18,2) NOT NULL,
    motivo text,
    estado character varying(50) DEFAULT 'Activa'::character varying NOT NULL,
    ultima_modificacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: notas_credito_interna_id_nota_credito_interna_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notas_credito_interna_id_nota_credito_interna_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notas_credito_interna_id_nota_credito_interna_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notas_credito_interna_id_nota_credito_interna_seq OWNED BY public.notas_credito_interna.id_nota_credito_interna;


--
-- Name: notas_entrega; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notas_entrega (
    id_nota_entrega integer NOT NULL,
    id_pedido integer,
    id_cliente integer NOT NULL,
    id_sucursal integer NOT NULL,
    id_usuario_creacion integer NOT NULL,
    fecha_entrega date DEFAULT CURRENT_DATE NOT NULL,
    estado character varying(50) NOT NULL,
    id_moneda_nota character varying(3) NOT NULL,
    tasa_cambio_base numeric(18,8) NOT NULL,
    subtotal numeric(18,2) NOT NULL,
    descuento_global numeric(18,2) DEFAULT 0 NOT NULL,
    impuesto_total numeric(18,2) NOT NULL,
    total_nota numeric(18,2) NOT NULL,
    es_a_credito boolean DEFAULT false NOT NULL,
    monto_pendiente_cobro numeric(18,2) NOT NULL,
    notas text,
    ultima_modificacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_cierre_caja integer
);


--
-- Name: notas_entrega_id_nota_entrega_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notas_entrega_id_nota_entrega_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notas_entrega_id_nota_entrega_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notas_entrega_id_nota_entrega_seq OWNED BY public.notas_entrega.id_nota_entrega;


--
-- Name: opciones_metodo_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opciones_metodo_pago (
    id_opcion_metodo_pago integer NOT NULL,
    id_metodo_pago integer NOT NULL,
    nombre_opcion character varying(100) NOT NULL,
    id_moneda_asociada character varying(3),
    es_banco boolean DEFAULT false NOT NULL,
    numero_cuenta character varying(50),
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: opciones_metodo_pago_id_opcion_metodo_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opciones_metodo_pago_id_opcion_metodo_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opciones_metodo_pago_id_opcion_metodo_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opciones_metodo_pago_id_opcion_metodo_pago_seq OWNED BY public.opciones_metodo_pago.id_opcion_metodo_pago;


--
-- Name: operaciones_cambio_divisas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operaciones_cambio_divisas (
    id_operacion_cambio integer NOT NULL,
    fecha_operacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_usuario_registro integer NOT NULL,
    id_moneda_venta character varying(3) NOT NULL,
    monto_venta numeric(18,2) NOT NULL,
    id_moneda_compra character varying(3) NOT NULL,
    monto_compra numeric(18,2) NOT NULL,
    tasa_cambio_aplicada numeric(18,8) NOT NULL,
    contraparte character varying(255),
    id_transaccion_salida integer NOT NULL,
    id_transaccion_entrada integer NOT NULL,
    notas text
);


--
-- Name: operaciones_cambio_divisas_id_operacion_cambio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operaciones_cambio_divisas_id_operacion_cambio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: operaciones_cambio_divisas_id_operacion_cambio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operaciones_cambio_divisas_id_operacion_cambio_seq OWNED BY public.operaciones_cambio_divisas.id_operacion_cambio;


--
-- Name: orden_compra_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden_compra_detalles (
    id_detalle_orden_compra integer NOT NULL,
    id_orden_compra integer NOT NULL,
    id_producto integer NOT NULL,
    nombre_producto_snapshot character varying(255) NOT NULL,
    cantidad_pedida numeric(18,4) NOT NULL,
    cantidad_recibida numeric(18,4) DEFAULT 0 NOT NULL,
    id_unidad_empaque_usada integer,
    cantidad_empaque numeric(18,4),
    cantidad_rollos numeric(18,4),
    total_metros numeric(18,4),
    costo_unitario numeric(18,4) NOT NULL,
    descuento_linea numeric(18,2) DEFAULT 0 NOT NULL,
    impuesto_linea numeric(18,2) NOT NULL,
    subtotal_linea numeric(18,2) NOT NULL
);


--
-- Name: orden_compra_detalles_id_detalle_orden_compra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orden_compra_detalles_id_detalle_orden_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orden_compra_detalles_id_detalle_orden_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orden_compra_detalles_id_detalle_orden_compra_seq OWNED BY public.orden_compra_detalles.id_detalle_orden_compra;


--
-- Name: orden_compra_impuestos_linea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden_compra_impuestos_linea (
    id_detalle_orden_compra integer NOT NULL,
    id_impuesto integer NOT NULL,
    monto_impuesto numeric(18,2) NOT NULL
);


--
-- Name: ordenes_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordenes_compra (
    id_orden_compra integer NOT NULL,
    id_proveedor integer NOT NULL,
    id_usuario_creacion integer NOT NULL,
    fecha_orden date DEFAULT CURRENT_DATE NOT NULL,
    fecha_entrega_estimada date,
    estado character varying(50) NOT NULL,
    id_moneda_compra character varying(3) NOT NULL,
    tasa_cambio_base numeric(18,8) NOT NULL,
    subtotal numeric(18,2) NOT NULL,
    descuento_global numeric(18,2) DEFAULT 0 NOT NULL,
    impuesto_total numeric(18,2) NOT NULL,
    total_orden numeric(18,2) NOT NULL,
    notas text,
    ultima_modificacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: ordenes_compra_id_orden_compra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ordenes_compra_id_orden_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ordenes_compra_id_orden_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordenes_compra_id_orden_compra_seq OWNED BY public.ordenes_compra.id_orden_compra;


--
-- Name: pagos_realizados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagos_realizados (
    id_pago_realizado integer NOT NULL,
    id_proveedor integer NOT NULL,
    id_usuario_registro integer NOT NULL,
    fecha_pago date DEFAULT CURRENT_DATE NOT NULL,
    monto_pago numeric(18,2) NOT NULL,
    id_moneda_pago character varying(3) NOT NULL,
    tasa_cambio_base numeric(18,8) NOT NULL,
    id_metodo_pago integer NOT NULL,
    referencia_pago character varying(100),
    banco_origen character varying(100),
    banco_destino character varying(100),
    estado_pago character varying(50) NOT NULL,
    monto_disponible_aplicar numeric(18,2) NOT NULL,
    notas text,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: pagos_realizados_id_pago_realizado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagos_realizados_id_pago_realizado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pagos_realizados_id_pago_realizado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagos_realizados_id_pago_realizado_seq OWNED BY public.pagos_realizados.id_pago_realizado;


--
-- Name: pagos_recibidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagos_recibidos (
    id_pago integer NOT NULL,
    id_cliente integer NOT NULL,
    id_usuario_registro integer NOT NULL,
    fecha_pago date DEFAULT CURRENT_DATE NOT NULL,
    monto_pago numeric(18,2) NOT NULL,
    id_moneda_pago character varying(3) NOT NULL,
    tasa_cambio_base numeric(18,8) NOT NULL,
    id_metodo_pago integer NOT NULL,
    referencia_pago character varying(100),
    banco_origen character varying(100),
    banco_destino character varying(100),
    estado_pago character varying(50) NOT NULL,
    monto_disponible_aplicar numeric(18,2) NOT NULL,
    notas text,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: pagos_recibidos_id_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagos_recibidos_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pagos_recibidos_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagos_recibidos_id_pago_seq OWNED BY public.pagos_recibidos.id_pago;


--
-- Name: pedido_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido_detalles (
    id_detalle_pedido integer NOT NULL,
    id_pedido integer NOT NULL,
    id_producto integer NOT NULL,
    nombre_producto_snapshot character varying(255) NOT NULL,
    cantidad_pedida numeric(18,4) NOT NULL,
    cantidad_entregada numeric(18,4) DEFAULT 0 NOT NULL,
    id_unidad_empaque_usada integer,
    cantidad_empaque numeric(18,4),
    cantidad_rollos numeric(18,4),
    total_metros numeric(18,4),
    precio_unitario numeric(18,4) NOT NULL,
    descuento_linea numeric(18,2) DEFAULT 0 NOT NULL,
    impuesto_linea numeric(18,2) NOT NULL,
    subtotal_linea numeric(18,2) NOT NULL
);


--
-- Name: pedido_detalles_id_detalle_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedido_detalles_id_detalle_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pedido_detalles_id_detalle_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedido_detalles_id_detalle_pedido_seq OWNED BY public.pedido_detalles.id_detalle_pedido;


--
-- Name: pedido_impuestos_linea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido_impuestos_linea (
    id_detalle_pedido integer NOT NULL,
    id_impuesto integer NOT NULL,
    monto_impuesto numeric(18,2) NOT NULL
);


--
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    id_pedido integer NOT NULL,
    id_cotizacion integer,
    id_cliente integer NOT NULL,
    id_usuario_creacion integer NOT NULL,
    fecha_pedido date DEFAULT CURRENT_DATE NOT NULL,
    fecha_entrega_estimada date,
    estado character varying(50) NOT NULL,
    id_moneda_pedido character varying(3) NOT NULL,
    tasa_cambio_base numeric(18,8) NOT NULL,
    subtotal numeric(18,2) NOT NULL,
    descuento_global numeric(18,2) DEFAULT 0 NOT NULL,
    impuesto_total numeric(18,2) NOT NULL,
    total_pedido numeric(18,2) NOT NULL,
    monto_adelantado numeric(18,2) DEFAULT 0 NOT NULL,
    notas text,
    ultima_modificacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_id_pedido_seq OWNED BY public.pedidos.id_pedido;


--
-- Name: permisos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permisos (
    id_permiso integer NOT NULL,
    nombre_permiso character varying(100) NOT NULL,
    descripcion text
);


--
-- Name: permisos_id_permiso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permisos_id_permiso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permisos_id_permiso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permisos_id_permiso_seq OWNED BY public.permisos.id_permiso;


--
-- Name: precios_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.precios_producto (
    id_precio_producto integer NOT NULL,
    id_producto integer NOT NULL,
    id_lista_precio integer NOT NULL,
    id_moneda character varying(3) NOT NULL,
    precio numeric(18,4) NOT NULL,
    fecha_inicio_vigencia date NOT NULL,
    fecha_fin_vigencia date
);


--
-- Name: precios_producto_id_precio_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.precios_producto_id_precio_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: precios_producto_id_precio_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.precios_producto_id_precio_producto_seq OWNED BY public.precios_producto.id_precio_producto;


--
-- Name: producto_descuentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto_descuentos (
    id_producto integer NOT NULL,
    id_descuento_producto integer NOT NULL
);


--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text,
    sku character varying(100),
    id_unidad_medida_base integer NOT NULL,
    costo_unitario numeric(18,4) NOT NULL,
    id_moneda_costo character varying(3),
    tipo_producto character varying(50) DEFAULT 'Bienes'::character varying NOT NULL,
    alerta_stock_minimo boolean DEFAULT true NOT NULL,
    largo numeric(10,2),
    ancho numeric(10,2),
    alto numeric(10,2),
    peso numeric(10,2),
    unidad_medida_dimension character varying(20),
    unidad_medida_peso character varying(20),
    volumen_unitario numeric(18,4),
    id_categoria_principal integer,
    id_fabricante integer,
    marca character varying(100),
    presentacion character varying(255),
    activo boolean DEFAULT true NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: productos_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: productos_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;


--
-- Name: proveedor_fabricante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedor_fabricante (
    id_proveedor integer NOT NULL,
    id_fabricante integer NOT NULL
);


--
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    id_proveedor integer NOT NULL,
    tipo_documento character varying(1) NOT NULL,
    numero_documento character varying(20) NOT NULL,
    nombre_razon_social character varying(255) NOT NULL,
    telefono_principal character varying(20),
    email_principal character varying(100),
    contacto_principal character varying(100),
    terminos_pago text,
    activo boolean DEFAULT true NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedores_id_proveedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_id_proveedor_seq OWNED BY public.proveedores.id_proveedor;


--
-- Name: recepcion_mercancia_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recepcion_mercancia_detalles (
    id_detalle_recepcion integer NOT NULL,
    id_recepcion integer NOT NULL,
    id_producto integer NOT NULL,
    nombre_producto_snapshot character varying(255) NOT NULL,
    cantidad_recibida numeric(18,4) NOT NULL,
    id_unidad_empaque_usada integer,
    cantidad_empaque numeric(18,4),
    cantidad_rollos numeric(18,4),
    total_metros numeric(18,4),
    id_almacen_destino integer NOT NULL,
    id_rollo_unico integer,
    costo_unitario numeric(18,4) NOT NULL
);


--
-- Name: recepcion_mercancia_detalles_id_detalle_recepcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recepcion_mercancia_detalles_id_detalle_recepcion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recepcion_mercancia_detalles_id_detalle_recepcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recepcion_mercancia_detalles_id_detalle_recepcion_seq OWNED BY public.recepcion_mercancia_detalles.id_detalle_recepcion;


--
-- Name: recepciones_mercancia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recepciones_mercancia (
    id_recepcion integer NOT NULL,
    id_orden_compra integer,
    id_proveedor integer NOT NULL,
    id_usuario_recepcion integer NOT NULL,
    fecha_recepcion date DEFAULT CURRENT_DATE NOT NULL,
    estado character varying(50) NOT NULL,
    notas text
);


--
-- Name: recepciones_mercancia_id_recepcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recepciones_mercancia_id_recepcion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recepciones_mercancia_id_recepcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recepciones_mercancia_id_recepcion_seq OWNED BY public.recepciones_mercancia.id_recepcion;


--
-- Name: recibos_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recibos_pago (
    id_recibo_pago integer NOT NULL,
    id_empleado integer NOT NULL,
    fecha_inicio_periodo date NOT NULL,
    fecha_fin_periodo date NOT NULL,
    fecha_pago date NOT NULL,
    salario_bruto numeric(18,2) NOT NULL,
    total_deducciones numeric(18,2) NOT NULL,
    total_bonificaciones numeric(18,2) NOT NULL,
    salario_neto numeric(18,2) NOT NULL,
    id_moneda_recibo character varying(3) NOT NULL,
    estado_pago character varying(50) NOT NULL,
    id_transaccion_pago integer,
    notas text,
    fecha_generacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: recibos_pago_id_recibo_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recibos_pago_id_recibo_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recibos_pago_id_recibo_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recibos_pago_id_recibo_pago_seq OWNED BY public.recibos_pago.id_recibo_pago;


--
-- Name: record_crediticio_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.record_crediticio_cliente (
    id_record integer NOT NULL,
    id_cliente integer NOT NULL,
    score_credito_interno numeric(5,2),
    fecha_ultima_evaluacion date,
    total_compras numeric(18,2) DEFAULT 0 NOT NULL,
    total_pagado numeric(18,2) DEFAULT 0 NOT NULL,
    total_deuda_actual numeric(18,2) DEFAULT 0 NOT NULL,
    dias_mora_promedio integer DEFAULT 0 NOT NULL,
    numero_incumplimientos integer DEFAULT 0 NOT NULL,
    fecha_actualizacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: record_crediticio_cliente_id_record_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.record_crediticio_cliente_id_record_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: record_crediticio_cliente_id_record_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.record_crediticio_cliente_id_record_seq OWNED BY public.record_crediticio_cliente.id_record;


--
-- Name: registros_reloj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registros_reloj (
    id_registro_reloj integer NOT NULL,
    id_empleado integer NOT NULL,
    fecha_hora_registro timestamp without time zone NOT NULL,
    tipo_registro character varying(20) NOT NULL,
    metodo_registro character varying(50) NOT NULL,
    id_dispositivo character varying(100),
    notas text
);


--
-- Name: registros_reloj_id_registro_reloj_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registros_reloj_id_registro_reloj_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: registros_reloj_id_registro_reloj_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registros_reloj_id_registro_reloj_seq OWNED BY public.registros_reloj.id_registro_reloj;


--
-- Name: rol_permisos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol_permisos (
    id_rol integer NOT NULL,
    id_permiso integer NOT NULL
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id_rol integer NOT NULL,
    nombre_rol character varying(50) NOT NULL
);


--
-- Name: roles_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_rol_seq OWNED BY public.roles.id_rol;


--
-- Name: sucursales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursales (
    id_sucursal integer NOT NULL,
    nombre_sucursal character varying(100) NOT NULL,
    telefono character varying(20),
    pais character varying(100),
    estado character varying(100),
    municipio character varying(100),
    parroquia character varying(100),
    tipo_via character varying(50),
    nombre_via character varying(100),
    numero_via_nombre_edificacion character varying(100),
    tipo_edificacion character varying(50),
    piso character varying(20),
    numero_inmueble character varying(50),
    enlace_gps text,
    fotos_inmueble text[],
    id_almacen_principal_sucursal integer
);


--
-- Name: sucursales_id_sucursal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sucursales_id_sucursal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sucursales_id_sucursal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sucursales_id_sucursal_seq OWNED BY public.sucursales.id_sucursal;


--
-- Name: tarjetas_fidelizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarjetas_fidelizacion (
    id_tarjeta integer NOT NULL,
    id_cliente integer NOT NULL,
    numero_tarjeta character varying(50) NOT NULL,
    puntos_acumulados numeric(18,2) DEFAULT 0 NOT NULL,
    fecha_emision date NOT NULL,
    fecha_vencimiento date,
    activa boolean DEFAULT true NOT NULL
);


--
-- Name: tarjetas_fidelizacion_id_tarjeta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarjetas_fidelizacion_id_tarjeta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tarjetas_fidelizacion_id_tarjeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarjetas_fidelizacion_id_tarjeta_seq OWNED BY public.tarjetas_fidelizacion.id_tarjeta;


--
-- Name: tasas_cambio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasas_cambio (
    id_tasa_cambio integer NOT NULL,
    id_moneda_origen character varying(3) NOT NULL,
    id_moneda_destino character varying(3) NOT NULL,
    tasa_conversion numeric(18,8) NOT NULL,
    fecha_vigencia date NOT NULL,
    hora_vigencia time without time zone NOT NULL
);


--
-- Name: tasas_cambio_id_tasa_cambio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasas_cambio_id_tasa_cambio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasas_cambio_id_tasa_cambio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasas_cambio_id_tasa_cambio_seq OWNED BY public.tasas_cambio.id_tasa_cambio;


--
-- Name: transacciones_financieras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transacciones_financieras (
    id_transaccion integer NOT NULL,
    fecha_transaccion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tipo_transaccion character varying(50) NOT NULL,
    monto numeric(18,2) NOT NULL,
    id_moneda character varying(3) NOT NULL,
    tasa_cambio_base numeric(18,8),
    id_cuenta_origen integer,
    tipo_cuenta_origen character varying(20),
    id_cuenta_destino integer,
    tipo_cuenta_destino character varying(20),
    id_metodo_pago integer,
    referencia character varying(255),
    concepto text NOT NULL,
    id_documento_origen character varying(255),
    tipo_documento_origen character varying(50),
    id_usuario_registro integer NOT NULL,
    es_conciliado boolean DEFAULT false NOT NULL,
    fecha_conciliacion date
);


--
-- Name: transacciones_financieras_id_transaccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transacciones_financieras_id_transaccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transacciones_financieras_id_transaccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transacciones_financieras_id_transaccion_seq OWNED BY public.transacciones_financieras.id_transaccion;


--
-- Name: unidades_empaque_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidades_empaque_producto (
    id_unidad_empaque_producto integer NOT NULL,
    id_producto integer NOT NULL,
    nombre_empaque character varying(50) NOT NULL,
    factor_conversion numeric(18,4) NOT NULL,
    es_unidad_venta_primaria boolean DEFAULT false NOT NULL,
    es_unidad_compra_primaria boolean DEFAULT false NOT NULL,
    requiere_detalle_rollo boolean DEFAULT false NOT NULL
);


--
-- Name: unidades_empaque_producto_id_unidad_empaque_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unidades_empaque_producto_id_unidad_empaque_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unidades_empaque_producto_id_unidad_empaque_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unidades_empaque_producto_id_unidad_empaque_producto_seq OWNED BY public.unidades_empaque_producto.id_unidad_empaque_producto;


--
-- Name: unidades_medida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidades_medida (
    id_unidad_medida integer NOT NULL,
    nombre character varying(50) NOT NULL,
    simbolo character varying(10) NOT NULL
);


--
-- Name: unidades_medida_id_unidad_medida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unidades_medida_id_unidad_medida_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unidades_medida_id_unidad_medida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unidades_medida_id_unidad_medida_seq OWNED BY public.unidades_medida.id_unidad_medida;


--
-- Name: usuario_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_roles (
    id_usuario integer NOT NULL,
    id_rol integer NOT NULL
);


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre_usuario character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password_hash character varying(255) NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ultimo_login timestamp without time zone
);


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- Name: vacaciones_ausencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacaciones_ausencias (
    id_vacacion_ausencia integer NOT NULL,
    id_empleado integer NOT NULL,
    tipo_registro character varying(50) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    dias_afectados integer NOT NULL,
    estado character varying(50) NOT NULL,
    notas text
);


--
-- Name: vacaciones_ausencias_id_vacacion_ausencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vacaciones_ausencias_id_vacacion_ausencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vacaciones_ausencias_id_vacacion_ausencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vacaciones_ausencias_id_vacacion_ausencia_seq OWNED BY public.vacaciones_ausencias.id_vacacion_ausencia;


--
-- Name: almacenes id_almacen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenes ALTER COLUMN id_almacen SET DEFAULT nextval('public.almacenes_id_almacen_seq'::regclass);


--
-- Name: aplicacion_nota_credito_interna id_aplicacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_nota_credito_interna ALTER COLUMN id_aplicacion SET DEFAULT nextval('public.aplicacion_nota_credito_interna_id_aplicacion_seq'::regclass);


--
-- Name: aplicacion_pagos id_aplicacion_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_pagos ALTER COLUMN id_aplicacion_pago SET DEFAULT nextval('public.aplicacion_pagos_id_aplicacion_pago_seq'::regclass);


--
-- Name: aplicacion_pagos_proveedor id_aplicacion_pago_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_pagos_proveedor ALTER COLUMN id_aplicacion_pago_proveedor SET DEFAULT nextval('public.aplicacion_pagos_proveedor_id_aplicacion_pago_proveedor_seq'::regclass);


--
-- Name: bancos id_banco; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bancos ALTER COLUMN id_banco SET DEFAULT nextval('public.bancos_id_banco_seq'::regclass);


--
-- Name: bonificaciones_especiales id_bonificacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bonificaciones_especiales ALTER COLUMN id_bonificacion SET DEFAULT nextval('public.bonificaciones_especiales_id_bonificacion_seq'::regclass);


--
-- Name: cajas id_caja; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajas ALTER COLUMN id_caja SET DEFAULT nextval('public.cajas_id_caja_seq'::regclass);


--
-- Name: cajeros id_cajero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajeros ALTER COLUMN id_cajero SET DEFAULT nextval('public.cajeros_id_cajero_seq'::regclass);


--
-- Name: calculo_horas_trabajadas id_calculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calculo_horas_trabajadas ALTER COLUMN id_calculo SET DEFAULT nextval('public.calculo_horas_trabajadas_id_calculo_seq'::regclass);


--
-- Name: categorias_producto id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias_producto ALTER COLUMN id_categoria SET DEFAULT nextval('public.categorias_producto_id_categoria_seq'::regclass);


--
-- Name: cierres_caja id_cierre_caja; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cierres_caja ALTER COLUMN id_cierre_caja SET DEFAULT nextval('public.cierres_caja_id_cierre_caja_seq'::regclass);


--
-- Name: clientes id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);


--
-- Name: comisiones_aplicadas id_comision_aplicada; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_aplicadas ALTER COLUMN id_comision_aplicada SET DEFAULT nextval('public.comisiones_aplicadas_id_comision_aplicada_seq'::regclass);


--
-- Name: comisiones_empleados id_comision; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_empleados ALTER COLUMN id_comision SET DEFAULT nextval('public.comisiones_empleados_id_comision_seq'::regclass);


--
-- Name: comisiones_pago id_comision_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_pago ALTER COLUMN id_comision_pago SET DEFAULT nextval('public.comisiones_pago_id_comision_pago_seq'::regclass);


--
-- Name: componentes_producto id_componente_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.componentes_producto ALTER COLUMN id_componente_producto SET DEFAULT nextval('public.componentes_producto_id_componente_producto_seq'::regclass);


--
-- Name: contactos_cliente id_contacto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos_cliente ALTER COLUMN id_contacto SET DEFAULT nextval('public.contactos_cliente_id_contacto_seq'::regclass);


--
-- Name: cotizacion_detalles id_detalle_cotizacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizacion_detalles ALTER COLUMN id_detalle_cotizacion SET DEFAULT nextval('public.cotizacion_detalles_id_detalle_cotizacion_seq'::regclass);


--
-- Name: cotizaciones id_cotizacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizaciones ALTER COLUMN id_cotizacion SET DEFAULT nextval('public.cotizaciones_id_cotizacion_seq'::regclass);


--
-- Name: cuentas_por_cobrar id_cuenta_cobrar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_cobrar ALTER COLUMN id_cuenta_cobrar SET DEFAULT nextval('public.cuentas_por_cobrar_id_cuenta_cobrar_seq'::regclass);


--
-- Name: cuentas_por_pagar id_cuenta_pagar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_pagar ALTER COLUMN id_cuenta_pagar SET DEFAULT nextval('public.cuentas_por_pagar_id_cuenta_pagar_seq'::regclass);


--
-- Name: descuentos_globales id_descuento_global; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.descuentos_globales ALTER COLUMN id_descuento_global SET DEFAULT nextval('public.descuentos_globales_id_descuento_global_seq'::regclass);


--
-- Name: descuentos_producto id_descuento_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.descuentos_producto ALTER COLUMN id_descuento_producto SET DEFAULT nextval('public.descuentos_producto_id_descuento_producto_seq'::regclass);


--
-- Name: direcciones_cliente id_direccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones_cliente ALTER COLUMN id_direccion SET DEFAULT nextval('public.direcciones_cliente_id_direccion_seq'::regclass);


--
-- Name: empleados id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados ALTER COLUMN id_empleado SET DEFAULT nextval('public.empleados_id_empleado_seq'::regclass);


--
-- Name: extracto_detalles id_extracto_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extracto_detalles ALTER COLUMN id_extracto_detalle SET DEFAULT nextval('public.extracto_detalles_id_extracto_detalle_seq'::regclass);


--
-- Name: extractos_bancarios id_extracto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extractos_bancarios ALTER COLUMN id_extracto SET DEFAULT nextval('public.extractos_bancarios_id_extracto_seq'::regclass);


--
-- Name: fabricantes id_fabricante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricantes ALTER COLUMN id_fabricante SET DEFAULT nextval('public.fabricantes_id_fabricante_seq'::regclass);


--
-- Name: factura_detalles id_detalle_factura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_detalles ALTER COLUMN id_detalle_factura SET DEFAULT nextval('public.factura_detalles_id_detalle_factura_seq'::regclass);


--
-- Name: factura_proveedor_detalles id_detalle_factura_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_proveedor_detalles ALTER COLUMN id_detalle_factura_proveedor SET DEFAULT nextval('public.factura_proveedor_detalles_id_detalle_factura_proveedor_seq'::regclass);


--
-- Name: facturas id_factura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas ALTER COLUMN id_factura SET DEFAULT nextval('public.facturas_id_factura_seq'::regclass);


--
-- Name: facturas_proveedor id_factura_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas_proveedor ALTER COLUMN id_factura_proveedor SET DEFAULT nextval('public.facturas_proveedor_id_factura_proveedor_seq'::regclass);


--
-- Name: gastos id_gasto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gastos ALTER COLUMN id_gasto SET DEFAULT nextval('public.gastos_id_gasto_seq'::regclass);


--
-- Name: gestiones_cobranza id_gestion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gestiones_cobranza ALTER COLUMN id_gestion SET DEFAULT nextval('public.gestiones_cobranza_id_gestion_seq'::regclass);


--
-- Name: impuestos id_impuesto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impuestos ALTER COLUMN id_impuesto SET DEFAULT nextval('public.impuestos_id_impuesto_seq'::regclass);


--
-- Name: inventario_rollos id_rollo_unico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario_rollos ALTER COLUMN id_rollo_unico SET DEFAULT nextval('public.inventario_rollos_id_rollo_unico_seq'::regclass);


--
-- Name: inventario_stock id_inventario_stock; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario_stock ALTER COLUMN id_inventario_stock SET DEFAULT nextval('public.inventario_stock_id_inventario_stock_seq'::regclass);


--
-- Name: listas_precio id_lista_precio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listas_precio ALTER COLUMN id_lista_precio SET DEFAULT nextval('public.listas_precio_id_lista_precio_seq'::regclass);


--
-- Name: metodos_pago id_metodo_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodos_pago ALTER COLUMN id_metodo_pago SET DEFAULT nextval('public.metodos_pago_id_metodo_pago_seq'::regclass);


--
-- Name: movimientos_caja id_movimiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos_caja ALTER COLUMN id_movimiento SET DEFAULT nextval('public.movimientos_caja_id_movimiento_seq'::regclass);


--
-- Name: movimientos_inventario id_movimiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos_inventario ALTER COLUMN id_movimiento SET DEFAULT nextval('public.movimientos_inventario_id_movimiento_seq'::regclass);


--
-- Name: nota_entrega_detalles id_detalle_nota_entrega; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_entrega_detalles ALTER COLUMN id_detalle_nota_entrega SET DEFAULT nextval('public.nota_entrega_detalles_id_detalle_nota_entrega_seq'::regclass);


--
-- Name: notas_credito_fiscal id_nota_credito_fiscal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_credito_fiscal ALTER COLUMN id_nota_credito_fiscal SET DEFAULT nextval('public.notas_credito_fiscal_id_nota_credito_fiscal_seq'::regclass);


--
-- Name: notas_credito_interna id_nota_credito_interna; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_credito_interna ALTER COLUMN id_nota_credito_interna SET DEFAULT nextval('public.notas_credito_interna_id_nota_credito_interna_seq'::regclass);


--
-- Name: notas_entrega id_nota_entrega; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_entrega ALTER COLUMN id_nota_entrega SET DEFAULT nextval('public.notas_entrega_id_nota_entrega_seq'::regclass);


--
-- Name: opciones_metodo_pago id_opcion_metodo_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opciones_metodo_pago ALTER COLUMN id_opcion_metodo_pago SET DEFAULT nextval('public.opciones_metodo_pago_id_opcion_metodo_pago_seq'::regclass);


--
-- Name: operaciones_cambio_divisas id_operacion_cambio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operaciones_cambio_divisas ALTER COLUMN id_operacion_cambio SET DEFAULT nextval('public.operaciones_cambio_divisas_id_operacion_cambio_seq'::regclass);


--
-- Name: orden_compra_detalles id_detalle_orden_compra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_compra_detalles ALTER COLUMN id_detalle_orden_compra SET DEFAULT nextval('public.orden_compra_detalles_id_detalle_orden_compra_seq'::regclass);


--
-- Name: ordenes_compra id_orden_compra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes_compra ALTER COLUMN id_orden_compra SET DEFAULT nextval('public.ordenes_compra_id_orden_compra_seq'::regclass);


--
-- Name: pagos_realizados id_pago_realizado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos_realizados ALTER COLUMN id_pago_realizado SET DEFAULT nextval('public.pagos_realizados_id_pago_realizado_seq'::regclass);


--
-- Name: pagos_recibidos id_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos_recibidos ALTER COLUMN id_pago SET DEFAULT nextval('public.pagos_recibidos_id_pago_seq'::regclass);


--
-- Name: pedido_detalles id_detalle_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_detalles ALTER COLUMN id_detalle_pedido SET DEFAULT nextval('public.pedido_detalles_id_detalle_pedido_seq'::regclass);


--
-- Name: pedidos id_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedidos_id_pedido_seq'::regclass);


--
-- Name: permisos id_permiso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permisos ALTER COLUMN id_permiso SET DEFAULT nextval('public.permisos_id_permiso_seq'::regclass);


--
-- Name: precios_producto id_precio_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precios_producto ALTER COLUMN id_precio_producto SET DEFAULT nextval('public.precios_producto_id_precio_producto_seq'::regclass);


--
-- Name: productos id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);


--
-- Name: proveedores id_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id_proveedor SET DEFAULT nextval('public.proveedores_id_proveedor_seq'::regclass);


--
-- Name: recepcion_mercancia_detalles id_detalle_recepcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recepcion_mercancia_detalles ALTER COLUMN id_detalle_recepcion SET DEFAULT nextval('public.recepcion_mercancia_detalles_id_detalle_recepcion_seq'::regclass);


--
-- Name: recepciones_mercancia id_recepcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recepciones_mercancia ALTER COLUMN id_recepcion SET DEFAULT nextval('public.recepciones_mercancia_id_recepcion_seq'::regclass);


--
-- Name: recibos_pago id_recibo_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recibos_pago ALTER COLUMN id_recibo_pago SET DEFAULT nextval('public.recibos_pago_id_recibo_pago_seq'::regclass);


--
-- Name: record_crediticio_cliente id_record; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record_crediticio_cliente ALTER COLUMN id_record SET DEFAULT nextval('public.record_crediticio_cliente_id_record_seq'::regclass);


--
-- Name: registros_reloj id_registro_reloj; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros_reloj ALTER COLUMN id_registro_reloj SET DEFAULT nextval('public.registros_reloj_id_registro_reloj_seq'::regclass);


--
-- Name: roles id_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id_rol SET DEFAULT nextval('public.roles_id_rol_seq'::regclass);


--
-- Name: sucursales id_sucursal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales ALTER COLUMN id_sucursal SET DEFAULT nextval('public.sucursales_id_sucursal_seq'::regclass);


--
-- Name: tarjetas_fidelizacion id_tarjeta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarjetas_fidelizacion ALTER COLUMN id_tarjeta SET DEFAULT nextval('public.tarjetas_fidelizacion_id_tarjeta_seq'::regclass);


--
-- Name: tasas_cambio id_tasa_cambio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasas_cambio ALTER COLUMN id_tasa_cambio SET DEFAULT nextval('public.tasas_cambio_id_tasa_cambio_seq'::regclass);


--
-- Name: transacciones_financieras id_transaccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transacciones_financieras ALTER COLUMN id_transaccion SET DEFAULT nextval('public.transacciones_financieras_id_transaccion_seq'::regclass);


--
-- Name: unidades_empaque_producto id_unidad_empaque_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_empaque_producto ALTER COLUMN id_unidad_empaque_producto SET DEFAULT nextval('public.unidades_empaque_producto_id_unidad_empaque_producto_seq'::regclass);


--
-- Name: unidades_medida id_unidad_medida; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medida ALTER COLUMN id_unidad_medida SET DEFAULT nextval('public.unidades_medida_id_unidad_medida_seq'::regclass);


--
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- Name: vacaciones_ausencias id_vacacion_ausencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacaciones_ausencias ALTER COLUMN id_vacacion_ausencia SET DEFAULT nextval('public.vacaciones_ausencias_id_vacacion_ausencia_seq'::regclass);


--
-- Name: almacenes almacenes_nombre_almacen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenes
    ADD CONSTRAINT almacenes_nombre_almacen_key UNIQUE (nombre_almacen);


--
-- Name: almacenes almacenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenes
    ADD CONSTRAINT almacenes_pkey PRIMARY KEY (id_almacen);


--
-- Name: aplicacion_nota_credito_interna aplicacion_nota_credito_interna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_nota_credito_interna
    ADD CONSTRAINT aplicacion_nota_credito_interna_pkey PRIMARY KEY (id_aplicacion);


--
-- Name: aplicacion_pagos aplicacion_pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_pagos
    ADD CONSTRAINT aplicacion_pagos_pkey PRIMARY KEY (id_aplicacion_pago);


--
-- Name: aplicacion_pagos_proveedor aplicacion_pagos_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_pagos_proveedor
    ADD CONSTRAINT aplicacion_pagos_proveedor_pkey PRIMARY KEY (id_aplicacion_pago_proveedor);

--
-- Name: bancos bancos_numero_cuenta_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bancos
    ADD CONSTRAINT bancos_numero_cuenta_key UNIQUE (numero_cuenta);


--
-- Name: bancos bancos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bancos
    ADD CONSTRAINT bancos_pkey PRIMARY KEY (id_banco);


--
-- Name: bonificaciones_especiales bonificaciones_especiales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bonificaciones_especiales
    ADD CONSTRAINT bonificaciones_especiales_pkey PRIMARY KEY (id_bonificacion);


--
-- Name: cajas cajas_nombre_caja_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajas
    ADD CONSTRAINT cajas_nombre_caja_key UNIQUE (nombre_caja);


--
-- Name: cajas cajas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajas
    ADD CONSTRAINT cajas_pkey PRIMARY KEY (id_caja);


--
-- Name: cajeros cajeros_id_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajeros
    ADD CONSTRAINT cajeros_id_usuario_key UNIQUE (id_usuario);


--
-- Name: cajeros cajeros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajeros
    ADD CONSTRAINT cajeros_pkey PRIMARY KEY (id_cajero);


--
-- Name: calculo_horas_trabajadas calculo_horas_trabajadas_id_empleado_fecha_inicio_periodo_f_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calculo_horas_trabajadas
    ADD CONSTRAINT calculo_horas_trabajadas_id_empleado_fecha_inicio_periodo_f_key UNIQUE (id_empleado, fecha_inicio_periodo, fecha_fin_periodo);


--
-- Name: calculo_horas_trabajadas calculo_horas_trabajadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calculo_horas_trabajadas
    ADD CONSTRAINT calculo_horas_trabajadas_pkey PRIMARY KEY (id_calculo);


--
-- Name: categoria_descuentos categoria_descuentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_descuentos
    ADD CONSTRAINT categoria_descuentos_pkey PRIMARY KEY (id_categoria, id_descuento_producto);


--
-- Name: categorias_producto categorias_producto_nombre_categoria_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias_producto
    ADD CONSTRAINT categorias_producto_nombre_categoria_key UNIQUE (nombre_categoria);


--
-- Name: categorias_producto categorias_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias_producto
    ADD CONSTRAINT categorias_producto_pkey PRIMARY KEY (id_categoria);


--
-- Name: cierres_caja cierres_caja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cierres_caja
    ADD CONSTRAINT cierres_caja_pkey PRIMARY KEY (id_cierre_caja);


--
-- Name: clientes clientes_numero_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_numero_documento_key UNIQUE (numero_documento);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);


--
-- Name: comisiones_aplicadas comisiones_aplicadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_aplicadas
    ADD CONSTRAINT comisiones_aplicadas_pkey PRIMARY KEY (id_comision_aplicada);


--
-- Name: comisiones_empleados comisiones_empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_empleados
    ADD CONSTRAINT comisiones_empleados_pkey PRIMARY KEY (id_comision);


--
-- Name: comisiones_pago comisiones_pago_id_metodo_pago_tipo_operacion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_pago
    ADD CONSTRAINT comisiones_pago_id_metodo_pago_tipo_operacion_key UNIQUE (id_metodo_pago, tipo_operacion);


--
-- Name: comisiones_pago comisiones_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_pago
    ADD CONSTRAINT comisiones_pago_pkey PRIMARY KEY (id_comision_pago);


--
-- Name: componentes_producto componentes_producto_id_producto_principal_id_producto_comp_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.componentes_producto
    ADD CONSTRAINT componentes_producto_id_producto_principal_id_producto_comp_key UNIQUE (id_producto_principal, id_producto_componente);


--
-- Name: componentes_producto componentes_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.componentes_producto
    ADD CONSTRAINT componentes_producto_pkey PRIMARY KEY (id_componente_producto);


--
-- Name: contactos_cliente contactos_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos_cliente
    ADD CONSTRAINT contactos_cliente_pkey PRIMARY KEY (id_contacto);


--
-- Name: cotizacion_detalles cotizacion_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizacion_detalles
    ADD CONSTRAINT cotizacion_detalles_pkey PRIMARY KEY (id_detalle_cotizacion);


--
-- Name: cotizacion_impuestos_linea cotizacion_impuestos_linea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizacion_impuestos_linea
    ADD CONSTRAINT cotizacion_impuestos_linea_pkey PRIMARY KEY (id_detalle_cotizacion, id_impuesto);


--
-- Name: cotizaciones cotizaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizaciones
    ADD CONSTRAINT cotizaciones_pkey PRIMARY KEY (id_cotizacion);


--
-- Name: cuentas_por_cobrar cuentas_por_cobrar_id_documento_origen_tipo_documento_orige_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_cobrar
    ADD CONSTRAINT cuentas_por_cobrar_id_documento_origen_tipo_documento_orige_key UNIQUE (id_documento_origen, tipo_documento_origen);


--
-- Name: cuentas_por_cobrar cuentas_por_cobrar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_cobrar
    ADD CONSTRAINT cuentas_por_cobrar_pkey PRIMARY KEY (id_cuenta_cobrar);


--
-- Name: cuentas_por_pagar cuentas_por_pagar_id_factura_proveedor_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_pagar
    ADD CONSTRAINT cuentas_por_pagar_id_factura_proveedor_key UNIQUE (id_factura_proveedor);


--
-- Name: cuentas_por_pagar cuentas_por_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_pagar
    ADD CONSTRAINT cuentas_por_pagar_pkey PRIMARY KEY (id_cuenta_pagar);


--
-- Name: descuentos_globales descuentos_globales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.descuentos_globales
    ADD CONSTRAINT descuentos_globales_pkey PRIMARY KEY (id_descuento_global);


--
-- Name: descuentos_producto descuentos_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.descuentos_producto
    ADD CONSTRAINT descuentos_producto_pkey PRIMARY KEY (id_descuento_producto);


--
-- Name: direcciones_cliente direcciones_cliente_id_cliente_nombre_direccion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones_cliente
    ADD CONSTRAINT direcciones_cliente_id_cliente_nombre_direccion_key UNIQUE (id_cliente, nombre_direccion);


--
-- Name: direcciones_cliente direcciones_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones_cliente
    ADD CONSTRAINT direcciones_cliente_pkey PRIMARY KEY (id_direccion);

--
-- Name: empleados empleados_cedula_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_cedula_key UNIQUE (cedula);


--
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id_empleado);


--
-- Name: extracto_detalles extracto_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extracto_detalles
    ADD CONSTRAINT extracto_detalles_pkey PRIMARY KEY (id_extracto_detalle);


--
-- Name: extractos_bancarios extractos_bancarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extractos_bancarios
    ADD CONSTRAINT extractos_bancarios_pkey PRIMARY KEY (id_extracto);


--
-- Name: fabricantes fabricantes_nombre_fabricante_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricantes
    ADD CONSTRAINT fabricantes_nombre_fabricante_key UNIQUE (nombre_fabricante);


--
-- Name: fabricantes fabricantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricantes
    ADD CONSTRAINT fabricantes_pkey PRIMARY KEY (id_fabricante);


--
-- Name: factura_detalles factura_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_detalles
    ADD CONSTRAINT factura_detalles_pkey PRIMARY KEY (id_detalle_factura);


--
-- Name: factura_impuestos_linea factura_impuestos_linea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_impuestos_linea
    ADD CONSTRAINT factura_impuestos_linea_pkey PRIMARY KEY (id_detalle_factura, id_impuesto);


--
-- Name: factura_proveedor_detalles factura_proveedor_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_proveedor_detalles
    ADD CONSTRAINT factura_proveedor_detalles_pkey PRIMARY KEY (id_detalle_factura_proveedor);


--
-- Name: factura_proveedor_impuestos_linea factura_proveedor_impuestos_linea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_proveedor_impuestos_linea
    ADD CONSTRAINT factura_proveedor_impuestos_linea_pkey PRIMARY KEY (id_detalle_factura_proveedor, id_impuesto);


--
-- Name: facturas facturas_numero_factura_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_numero_factura_key UNIQUE (numero_factura);


--
-- Name: facturas facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id_factura);


--
-- Name: facturas_proveedor facturas_proveedor_numero_factura_proveedor_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas_proveedor
    ADD CONSTRAINT facturas_proveedor_numero_factura_proveedor_key UNIQUE (numero_factura_proveedor);


--
-- Name: facturas_proveedor facturas_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas_proveedor
    ADD CONSTRAINT facturas_proveedor_pkey PRIMARY KEY (id_factura_proveedor);


--
-- Name: gastos gastos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gastos
    ADD CONSTRAINT gastos_pkey PRIMARY KEY (id_gasto);


--
-- Name: gestiones_cobranza gestiones_cobranza_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gestiones_cobranza
    ADD CONSTRAINT gestiones_cobranza_pkey PRIMARY KEY (id_gestion);


--
-- Name: impuestos impuestos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impuestos
    ADD CONSTRAINT impuestos_pkey PRIMARY KEY (id_impuesto);


--
-- Name: inventario_rollos inventario_rollos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario_rollos
    ADD CONSTRAINT inventario_rollos_pkey PRIMARY KEY (id_rollo_unico);


--
-- Name: inventario_stock inventario_stock_id_producto_id_almacen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario_stock
    ADD CONSTRAINT inventario_stock_id_producto_id_almacen_key UNIQUE (id_producto, id_almacen);


--
-- Name: inventario_stock inventario_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario_stock
    ADD CONSTRAINT inventario_stock_pkey PRIMARY KEY (id_inventario_stock);


--
-- Name: listas_precio listas_precio_nombre_lista_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listas_precio
    ADD CONSTRAINT listas_precio_nombre_lista_key UNIQUE (nombre_lista);


--
-- Name: listas_precio listas_precio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listas_precio
    ADD CONSTRAINT listas_precio_pkey PRIMARY KEY (id_lista_precio);


--
-- Name: metodos_pago metodos_pago_nombre_metodo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodos_pago
    ADD CONSTRAINT metodos_pago_nombre_metodo_key UNIQUE (nombre_metodo);


--
-- Name: metodos_pago metodos_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodos_pago
    ADD CONSTRAINT metodos_pago_pkey PRIMARY KEY (id_metodo_pago);


--
-- Name: monedas monedas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monedas
    ADD CONSTRAINT monedas_pkey PRIMARY KEY (id_moneda);


--
-- Name: movimientos_caja movimientos_caja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos_caja
    ADD CONSTRAINT movimientos_caja_pkey PRIMARY KEY (id_movimiento);


--
-- Name: movimientos_inventario movimientos_inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos_inventario
    ADD CONSTRAINT movimientos_inventario_pkey PRIMARY KEY (id_movimiento);


--
-- Name: nota_entrega_detalles nota_entrega_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_entrega_detalles
    ADD CONSTRAINT nota_entrega_detalles_pkey PRIMARY KEY (id_detalle_nota_entrega);


--
-- Name: nota_entrega_impuestos_linea nota_entrega_impuestos_linea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota_entrega_impuestos_linea
    ADD CONSTRAINT nota_entrega_impuestos_linea_pkey PRIMARY KEY (id_detalle_nota_entrega, id_impuesto);


--
-- Name: notas_credito_fiscal notas_credito_fiscal_numero_nota_credito_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_credito_fiscal
    ADD CONSTRAINT notas_credito_fiscal_numero_nota_credito_key UNIQUE (numero_nota_credito);


--
-- Name: notas_credito_fiscal notas_credito_fiscal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_credito_fiscal
    ADD CONSTRAINT notas_credito_fiscal_pkey PRIMARY KEY (id_nota_credito_fiscal);


--
-- Name: notas_credito_interna notas_credito_interna_numero_nota_credito_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_credito_interna
    ADD CONSTRAINT notas_credito_interna_numero_nota_credito_key UNIQUE (numero_nota_credito);


--
-- Name: notas_credito_interna notas_credito_interna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_credito_interna
    ADD CONSTRAINT notas_credito_interna_pkey PRIMARY KEY (id_nota_credito_interna);


--
-- Name: notas_entrega notas_entrega_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_entrega
    ADD CONSTRAINT notas_entrega_pkey PRIMARY KEY (id_nota_entrega);


--
-- Name: opciones_metodo_pago opciones_metodo_pago_id_metodo_pago_nombre_opcion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opciones_metodo_pago
    ADD CONSTRAINT opciones_metodo_pago_id_metodo_pago_nombre_opcion_key UNIQUE (id_metodo_pago, nombre_opcion);


--
-- Name: opciones_metodo_pago opciones_metodo_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opciones_metodo_pago
    ADD CONSTRAINT opciones_metodo_pago_pkey PRIMARY KEY (id_opcion_metodo_pago);


--
-- Name: operaciones_cambio_divisas operaciones_cambio_divisas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operaciones_cambio_divisas
    ADD CONSTRAINT operaciones_cambio_divisas_pkey PRIMARY KEY (id_operacion_cambio);


--
-- Name: orden_compra_detalles orden_compra_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_compra_detalles
    ADD CONSTRAINT orden_compra_detalles_pkey PRIMARY KEY (id_detalle_orden_compra);


--
-- Name: orden_compra_impuestos_linea orden_compra_impuestos_linea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_compra_impuestos_linea
    ADD CONSTRAINT orden_compra_impuestos_linea_pkey PRIMARY KEY (id_detalle_orden_compra, id_impuesto);


--
-- Name: ordenes_compra ordenes_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes_compra
    ADD CONSTRAINT ordenes_compra_pkey PRIMARY KEY (id_orden_compra);


--
-- Name: pagos_realizados pagos_realizados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos_realizados
    ADD CONSTRAINT pagos_realizados_pkey PRIMARY KEY (id_pago_realizado);


--
-- Name: pagos_recibidos pagos_recibidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos_recibidos
    ADD CONSTRAINT pagos_recibidos_pkey PRIMARY KEY (id_pago);


--
-- Name: pedido_detalles pedido_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_detalles
    ADD CONSTRAINT pedido_detalles_pkey PRIMARY KEY (id_detalle_pedido);


--
-- Name: pedido_impuestos_linea pedido_impuestos_linea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_impuestos_linea
    ADD CONSTRAINT pedido_impuestos_linea_pkey PRIMARY KEY (id_detalle_pedido, id_impuesto);


--
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id_pedido);


--
-- Name: permisos permisos_nombre_permiso_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permisos
    ADD CONSTRAINT permisos_nombre_permiso_key UNIQUE (nombre_permiso);


--
-- Name: permisos permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permisos
    ADD CONSTRAINT permisos_pkey PRIMARY KEY (id_permiso);


--
-- Name: precios_producto precios_producto_id_producto_id_lista_precio_id_moneda_fech_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precios_producto
    ADD CONSTRAINT precios_producto_id_producto_id_lista_precio_id_moneda_fech_key UNIQUE (id_producto, id_lista_precio, id_moneda, fecha_inicio_vigencia);


--
-- Name: precios_producto precios_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precios_producto
    ADD CONSTRAINT precios_producto_pkey PRIMARY KEY (id_precio_producto);


--
-- Name: producto_descuentos producto_descuentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_descuentos
    ADD CONSTRAINT producto_descuentos_pkey PRIMARY KEY (id_producto, id_descuento_producto);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);


--
-- Name: productos productos_sku_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_sku_key UNIQUE (sku);


--
-- Name: proveedor_fabricante proveedor_fabricante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor_fabricante
    ADD CONSTRAINT proveedor_fabricante_pkey PRIMARY KEY (id_proveedor, id_fabricante);


--
-- Name: proveedores proveedores_numero_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_numero_documento_key UNIQUE (numero_documento);


--
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id_proveedor);


--
-- Name: recepcion_mercancia_detalles recepcion_mercancia_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recepcion_mercancia_detalles
    ADD CONSTRAINT recepcion_mercancia_detalles_pkey PRIMARY KEY (id_detalle_recepcion);


--
-- Name: recepciones_mercancia recepciones_mercancia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recepciones_mercancia
    ADD CONSTRAINT recepciones_mercancia_pkey PRIMARY KEY (id_recepcion);


--
-- Name: recibos_pago recibos_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recibos_pago
    ADD CONSTRAINT recibos_pago_pkey PRIMARY KEY (id_recibo_pago);


--
-- Name: record_crediticio_cliente record_crediticio_cliente_id_cliente_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record_crediticio_cliente
    ADD CONSTRAINT record_crediticio_cliente_id_cliente_key UNIQUE (id_cliente);


--
-- Name: record_crediticio_cliente record_crediticio_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record_crediticio_cliente
    ADD CONSTRAINT record_crediticio_cliente_pkey PRIMARY KEY (id_record);


--
-- Name: registros_reloj registros_reloj_id_empleado_fecha_hora_registro_tipo_regist_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros_reloj
    ADD CONSTRAINT registros_reloj_id_empleado_fecha_hora_registro_tipo_regist_key UNIQUE (id_empleado, fecha_hora_registro, tipo_registro);


--
-- Name: registros_reloj registros_reloj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros_reloj
    ADD CONSTRAINT registros_reloj_pkey PRIMARY KEY (id_registro_reloj);


--
-- Name: rol_permisos rol_permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_permisos
    ADD CONSTRAINT rol_permisos_pkey PRIMARY KEY (id_rol, id_permiso);


--
-- Name: roles roles_nombre_rol_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_nombre_rol_key UNIQUE (nombre_rol);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_rol);


--
-- Name: sucursales sucursales_nombre_sucursal_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_nombre_sucursal_key UNIQUE (nombre_sucursal);


--
-- Name: sucursales sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_pkey PRIMARY KEY (id_sucursal);


--
-- Name: tarjetas_fidelizacion tarjetas_fidelizacion_numero_tarjeta_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarjetas_fidelizacion
    ADD CONSTRAINT tarjetas_fidelizacion_numero_tarjeta_key UNIQUE (numero_tarjeta);


--
-- Name: tarjetas_fidelizacion tarjetas_fidelizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarjetas_fidelizacion
    ADD CONSTRAINT tarjetas_fidelizacion_pkey PRIMARY KEY (id_tarjeta);


--
-- Name: tasas_cambio tasas_cambio_id_moneda_origen_id_moneda_destino_fecha_vigen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasas_cambio
    ADD CONSTRAINT tasas_cambio_id_moneda_origen_id_moneda_destino_fecha_vigen_key UNIQUE (id_moneda_origen, id_moneda_destino, fecha_vigencia, hora_vigencia);


--
-- Name: tasas_cambio tasas_cambio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasas_cambio
    ADD CONSTRAINT tasas_cambio_pkey PRIMARY KEY (id_tasa_cambio);


--
-- Name: transacciones_financieras transacciones_financieras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transacciones_financieras
    ADD CONSTRAINT transacciones_financieras_pkey PRIMARY KEY (id_transaccion);


--
-- Name: unidades_empaque_producto unidades_empaque_producto_id_producto_nombre_empaque_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_empaque_producto
    ADD CONSTRAINT unidades_empaque_producto_id_producto_nombre_empaque_key UNIQUE (id_producto, nombre_empaque);


--
-- Name: unidades_empaque_producto unidades_empaque_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_empaque_producto
    ADD CONSTRAINT unidades_empaque_producto_pkey PRIMARY KEY (id_unidad_empaque_producto);


--
-- Name: unidades_medida unidades_medida_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medida
    ADD CONSTRAINT unidades_medida_nombre_key UNIQUE (nombre);


--
-- Name: unidades_medida unidades_medida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medida
    ADD CONSTRAINT unidades_medida_pkey PRIMARY KEY (id_unidad_medida);


--
-- Name: unidades_medida unidades_medida_simbolo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medida
    ADD CONSTRAINT unidades_medida_simbolo_key UNIQUE (simbolo);


--
-- Name: usuario_roles usuario_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_roles
    ADD CONSTRAINT usuario_roles_pkey PRIMARY KEY (id_usuario, id_rol);


--
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios usuarios_nombre_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_nombre_usuario_key UNIQUE (nombre_usuario);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- Name: vacaciones_ausencias vacaciones_ausencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacaciones_ausencias
    ADD CONSTRAINT vacaciones_ausencias_pkey PRIMARY KEY (id_vacacion_ausencia);

--
-- Name: almacenes almacenes_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenes
    ADD CONSTRAINT almacenes_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES public.sucursales(id_sucursal);


--
-- Name: aplicacion_nota_credito_interna aplicacion_nota_credito_interna_id_nota_credito_interna_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_nota_credito_interna
    ADD CONSTRAINT aplicacion_nota_credito_interna_id_nota_credito_interna_fkey FOREIGN KEY (id_nota_credito_interna) REFERENCES public.notas_credito_interna(id_nota_credito_interna);


--
-- Name: aplicacion_nota_credito_interna aplicacion_nota_credito_interna_id_usuario_aplicacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_nota_credito_interna
    ADD CONSTRAINT aplicacion_nota_credito_interna_id_usuario_aplicacion_fkey FOREIGN KEY (id_usuario_aplicacion) REFERENCES public.usuarios(id_usuario);


--
-- Name: aplicacion_pagos aplicacion_pagos_id_moneda_aplicacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_pagos
    ADD CONSTRAINT aplicacion_pagos_id_moneda_aplicacion_fkey FOREIGN KEY (id_moneda_aplicacion) REFERENCES public.monedas(id_moneda);


--
-- Name: aplicacion_pagos aplicacion_pagos_id_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_pagos
    ADD CONSTRAINT aplicacion_pagos_id_pago_fkey FOREIGN KEY (id_pago) REFERENCES public.pagos_recibidos(id_pago);


--
-- Name: aplicacion_pagos_proveedor aplicacion_pagos_proveedor_id_factura_proveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_pagos_proveedor
    ADD CONSTRAINT aplicacion_pagos_proveedor_id_factura_proveedor_fkey FOREIGN KEY (id_factura_proveedor) REFERENCES public.facturas_proveedor(id_factura_proveedor);


--
-- Name: aplicacion_pagos_proveedor aplicacion_pagos_proveedor_id_moneda_aplicacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_pagos_proveedor
    ADD CONSTRAINT aplicacion_pagos_proveedor_id_moneda_aplicacion_fkey FOREIGN KEY (id_moneda_aplicacion) REFERENCES public.monedas(id_moneda);


--
-- Name: aplicacion_pagos_proveedor aplicacion_pagos_proveedor_id_pago_realizado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_pagos_proveedor
    ADD CONSTRAINT aplicacion_pagos_proveedor_id_pago_realizado_fkey FOREIGN KEY (id_pago_realizado) REFERENCES public.pagos_realizados(id_pago_realizado);


--
-- Name: bancos bancos_id_moneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bancos
    ADD CONSTRAINT bancos_id_moneda_fkey FOREIGN KEY (id_moneda) REFERENCES public.monedas(id_moneda);


--
-- Name: bonificaciones_especiales bonificaciones_especiales_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bonificaciones_especiales
    ADD CONSTRAINT bonificaciones_especiales_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleados(id_empleado);


--
-- Name: bonificaciones_especiales bonificaciones_especiales_id_moneda_bonificacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bonificaciones_especiales
    ADD CONSTRAINT bonificaciones_especiales_id_moneda_bonificacion_fkey FOREIGN KEY (id_moneda_bonificacion) REFERENCES public.monedas(id_moneda);


--
-- Name: bonificaciones_especiales bonificaciones_especiales_id_recibo_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bonificaciones_especiales
    ADD CONSTRAINT bonificaciones_especiales_id_recibo_pago_fkey FOREIGN KEY (id_recibo_pago) REFERENCES public.recibos_pago(id_recibo_pago);


--
-- Name: bonificaciones_especiales bonificaciones_especiales_id_transaccion_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bonificaciones_especiales
    ADD CONSTRAINT bonificaciones_especiales_id_transaccion_pago_fkey FOREIGN KEY (id_transaccion_pago) REFERENCES public.transacciones_financieras(id_transaccion);


--
-- Name: cajas cajas_id_cajero_asociado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajas
    ADD CONSTRAINT cajas_id_cajero_asociado_fkey FOREIGN KEY (id_cajero_asociado) REFERENCES public.cajeros(id_cajero);


--
-- Name: cajas cajas_id_moneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajas
    ADD CONSTRAINT cajas_id_moneda_fkey FOREIGN KEY (id_moneda) REFERENCES public.monedas(id_moneda);


--
-- Name: cajas cajas_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajas
    ADD CONSTRAINT cajas_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES public.sucursales(id_sucursal);


--
-- Name: cajeros cajeros_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajeros
    ADD CONSTRAINT cajeros_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES public.sucursales(id_sucursal);


--
-- Name: cajeros cajeros_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajeros
    ADD CONSTRAINT cajeros_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- Name: calculo_horas_trabajadas calculo_horas_trabajadas_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calculo_horas_trabajadas
    ADD CONSTRAINT calculo_horas_trabajadas_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleados(id_empleado);


--
-- Name: calculo_horas_trabajadas calculo_horas_trabajadas_id_moneda_calculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calculo_horas_trabajadas
    ADD CONSTRAINT calculo_horas_trabajadas_id_moneda_calculo_fkey FOREIGN KEY (id_moneda_calculo) REFERENCES public.monedas(id_moneda);


--
-- Name: calculo_horas_trabajadas calculo_horas_trabajadas_id_usuario_calculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calculo_horas_trabajadas
    ADD CONSTRAINT calculo_horas_trabajadas_id_usuario_calculo_fkey FOREIGN KEY (id_usuario_calculo) REFERENCES public.usuarios(id_usuario);


--
-- Name: categoria_descuentos categoria_descuentos_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_descuentos
    ADD CONSTRAINT categoria_descuentos_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categorias_producto(id_categoria);


--
-- Name: categoria_descuentos categoria_descuentos_id_descuento_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_descuentos
    ADD CONSTRAINT categoria_descuentos_id_descuento_producto_fkey FOREIGN KEY (id_descuento_producto) REFERENCES public.descuentos_producto(id_descuento_producto);


--
-- Name: categorias_producto categorias_producto_id_categoria_padre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias_producto
    ADD CONSTRAINT categorias_producto_id_categoria_padre_fkey FOREIGN KEY (id_categoria_padre) REFERENCES public.categorias_producto(id_categoria);


--
-- Name: cierres_caja cierres_caja_id_cajero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cierres_caja
    ADD CONSTRAINT cierres_caja_id_cajero_fkey FOREIGN KEY (id_cajero) REFERENCES public.cajeros(id_cajero);


--
-- Name: cierres_caja cierres_caja_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cierres_caja
    ADD CONSTRAINT cierres_caja_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES public.sucursales(id_sucursal);


--
-- Name: clientes clientes_id_lista_precio_default_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_id_lista_precio_default_fkey FOREIGN KEY (id_lista_precio_default) REFERENCES public.listas_precio(id_lista_precio);


--
-- Name: comisiones_aplicadas comisiones_aplicadas_id_metodo_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_aplicadas
    ADD CONSTRAINT comisiones_aplicadas_id_metodo_pago_fkey FOREIGN KEY (id_metodo_pago) REFERENCES public.metodos_pago(id_metodo_pago);


--
-- Name: comisiones_aplicadas comisiones_aplicadas_id_moneda_comision_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_aplicadas
    ADD CONSTRAINT comisiones_aplicadas_id_moneda_comision_fkey FOREIGN KEY (id_moneda_comision) REFERENCES public.monedas(id_moneda);


--
-- Name: comisiones_aplicadas comisiones_aplicadas_id_transaccion_financiera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_aplicadas
    ADD CONSTRAINT comisiones_aplicadas_id_transaccion_financiera_fkey FOREIGN KEY (id_transaccion_financiera) REFERENCES public.transacciones_financieras(id_transaccion);


--
-- Name: comisiones_empleados comisiones_empleados_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_empleados
    ADD CONSTRAINT comisiones_empleados_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleados(id_empleado);


--
-- Name: comisiones_empleados comisiones_empleados_id_moneda_comision_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_empleados
    ADD CONSTRAINT comisiones_empleados_id_moneda_comision_fkey FOREIGN KEY (id_moneda_comision) REFERENCES public.monedas(id_moneda);


--
-- Name: comisiones_empleados comisiones_empleados_id_recibo_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_empleados
    ADD CONSTRAINT comisiones_empleados_id_recibo_pago_fkey FOREIGN KEY (id_recibo_pago) REFERENCES public.recibos_pago(id_recibo_pago);


--
-- Name: comisiones_pago comisiones_pago_id_metodo_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comisiones_pago
    ADD CONSTRAINT comisiones_pago_id_metodo_pago_fkey FOREIGN KEY (id_metodo_pago) REFERENCES public.metodos_pago(id_metodo_pago);


--
-- Name: componentes_producto componentes_producto_id_producto_componente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.componentes_producto
    ADD CONSTRAINT componentes_producto_id_producto_componente_fkey FOREIGN KEY (id_producto_componente) REFERENCES public.productos(id_producto);


--
-- Name: componentes_producto componentes_producto_id_producto_principal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.componentes_producto
    ADD CONSTRAINT componentes_producto_id_producto_principal_fkey FOREIGN KEY (id_producto_principal) REFERENCES public.productos(id_producto);


--
-- Name: componentes_producto componentes_producto_id_unidad_medida_componente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.componentes_producto
        ADD CONSTRAINT componentes_producto_id_unidad_medida_componente_fkey FOREIGN KEY (id_unidad_medida_componente) REFERENCES public.unidades_medida(id_unidad_medida); -- <-- ¡CORREGIDO AQUÍ!

        