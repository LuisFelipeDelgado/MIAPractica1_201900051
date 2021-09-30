CREATE TABLE public.temp (
    nombre_cliente character varying(40),
    correo_cliente character varying(65),
    cliente_activo character varying(3),
    fecha_creacion timestamp without time zone,
    tienda_preferida character varying(10),
    direccion_cliente character varying(100),
    codigo_postal_cliente character varying(6),
    ciudad_cliente character varying(60),
    pais_cliente character varying(50),
    fecha_renta timestamp without time zone,
    fecha_retorno timestamp without time zone,
    monto_a_pagar double precision,
    fecha_pago timestamp without time zone,
    nombre_empleado character varying(40),
    correo_empleado character varying(65),
    empleado_activo character varying(3),
    tienda_empleado character varying(10),
    usuario_empleado character varying(30),
    contrasena_empleado character varying(100),
    direccion_empleado character varying(100),
    codigo_postal_empleado character varying(5),
    ciudad_empleado character varying(60),
    pais_empleado character varying(50),
    nombre_tienda character varying(10),
    encargado_tienda character varying(40),
    direccion_tienda character varying(100),
    codigo_postal_tienda character varying(5),
    ciudad_tienda character varying(60),
    pais_tienda character varying(50),
    tienda_pelicula character varying(10),
    nombre_pelicula character varying(60),
    descripcion_pelicula character varying(200),
    ano_lanzamiento character varying(4),
    dias_renta smallint,
    costo_renta double precision,
    duracion smallint,
    costo_por_dano double precision,
    clasificacion character varying(4),
    lenguaje_pelicula character varying(60),
    categoria_pelicula character varying(30),
    actor_pelicula character varying(100)
);

ALTER TABLE public.temp OWNER TO postgres;
