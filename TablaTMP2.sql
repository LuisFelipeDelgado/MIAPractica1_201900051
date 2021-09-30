CREATE TABLE public.actor (
    actorid integer NOT NULL,
    nombre character varying(20) NOT NULL,
    apellido character varying(20) NOT NULL
);

ALTER TABLE public.actor OWNER TO postgres;

CREATE SEQUENCE public.actor_actorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.actor_actorid_seq OWNER TO postgres;

ALTER SEQUENCE public.actor_actorid_seq OWNED BY public.actor.actorid;

CREATE TABLE public.actor_pelicula (
    actors_peliculaid integer NOT NULL,
    actor_peliculaid integer NOT NULL,
    actor_actorid integer NOT NULL
);

ALTER TABLE public.actor_pelicula OWNER TO postgres;

CREATE SEQUENCE public.actor_pelicula_actors_peliculaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.actor_pelicula_actors_peliculaid_seq OWNER TO postgres;

ALTER SEQUENCE public.actor_pelicula_actors_peliculaid_seq OWNED BY public.actor_pelicula.actors_peliculaid;

CREATE TABLE public.categoria (
    categoriaid integer NOT NULL,
    nombre character varying(60) NOT NULL
);

ALTER TABLE public.categoria OWNER TO postgres;

CREATE SEQUENCE public.categoria_categoriaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_categoriaid_seq OWNER TO postgres;

ALTER SEQUENCE public.categoria_categoriaid_seq OWNED BY public.categoria.categoriaid;

CREATE TABLE public.categorias_peliculas (
    categorias_peliculasid integer NOT NULL,
    categoria_peliculasid integer NOT NULL,
    categoria_categoriaid integer NOT NULL
);


ALTER TABLE public.categorias_peliculas OWNER TO postgres;

CREATE SEQUENCE public.categorias_peliculas_categorias_peliculasid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_peliculas_categorias_peliculasid_seq OWNER TO postgres;

ALTER SEQUENCE public.categorias_peliculas_categorias_peliculasid_seq OWNED BY public.categorias_peliculas.categorias_peliculasid;

CREATE TABLE public.ciudad (
    ciudadid integer NOT NULL,
    pais_paisid integer NOT NULL,
    ciudad character varying(60) NOT NULL,
    codigo_postal character varying(6)
);


ALTER TABLE public.ciudad OWNER TO postgres;

CREATE SEQUENCE public.ciudad_ciudadid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudad_ciudadid_seq OWNER TO postgres;

ALTER SEQUENCE public.ciudad_ciudadid_seq OWNED BY public.ciudad.ciudadid;

CREATE TABLE public.cliente (
    clienteid integer NOT NULL,
    cliente_tiendaid integer NOT NULL,
    cliente_ciudadid integer NOT NULL,
    nombre character varying(20) NOT NULL,
    apellido character varying(20) NOT NULL,
    correo character varying(70) NOT NULL,
    estado character varying(3) NOT NULL,
    direccion character varying(70) NOT NULL,
    registro timestamp without time zone NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

CREATE SEQUENCE public.cliente_clienteid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.cliente_clienteid_seq OWNER TO postgres;

ALTER SEQUENCE public.cliente_clienteid_seq OWNED BY public.cliente.clienteid;

CREATE TABLE public.empleado (
    empleadoid integer NOT NULL,
    empleado_tiendaid integer NOT NULL,
    nombre character varying(20) NOT NULL,
    apellido character varying(20) NOT NULL,
    direccion character varying(70) NOT NULL,
    correo character varying(70) NOT NULL,
    estado character varying(3) NOT NULL,
    usuario character varying(30) NOT NULL,
    "contraseña" character varying(100) NOT NULL,
    codigo_postal character varying(6)
);

ALTER TABLE public.empleado OWNER TO postgres;

CREATE SEQUENCE public.empleado_empleadoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.empleado_empleadoid_seq OWNER TO postgres;

ALTER SEQUENCE public.empleado_empleadoid_seq OWNED BY public.empleado.empleadoid;

CREATE TABLE public.idioma (
    idiomaid integer NOT NULL,
    idioma character varying(60) NOT NULL
);


ALTER TABLE public.idioma OWNER TO postgres;

CREATE SEQUENCE public.idioma_idiomaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idioma_idiomaid_seq OWNER TO postgres;

ALTER SEQUENCE public.idioma_idiomaid_seq OWNED BY public.idioma.idiomaid;

CREATE TABLE public.idioma_pelicula (
    idiomas_peliculaid integer NOT NULL,
    idioma_peliculaid integer NOT NULL,
    idioma_idiomaid integer NOT NULL
);

ALTER TABLE public.idioma_pelicula OWNER TO postgres;

CREATE SEQUENCE public.idioma_pelicula_idiomas_peliculaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.idioma_pelicula_idiomas_peliculaid_seq OWNER TO postgres;

ALTER SEQUENCE public.idioma_pelicula_idiomas_peliculaid_seq OWNED BY public.idioma_pelicula.idiomas_peliculaid;

CREATE TABLE public.pais (
    paisid integer NOT NULL,
    nombre character varying(50) NOT NULL
);

ALTER TABLE public.pais OWNER TO postgres;

CREATE SEQUENCE public.pais_paisid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pais_paisid_seq OWNER TO postgres;

ALTER SEQUENCE public.pais_paisid_seq OWNED BY public.pais.paisid;

CREATE TABLE public.pelicula (
    peliculaid integer NOT NULL,
    titulo character varying(60) NOT NULL,
    descripcion character varying(200) NOT NULL,
    lanzamiento character varying(4) NOT NULL,
    duracion integer NOT NULL,
    cantidad_dias integer NOT NULL,
    costo double precision NOT NULL,
    recargo double precision NOT NULL,
    clasificacion character varying(4) NOT NULL
);


ALTER TABLE public.pelicula OWNER TO postgres;

CREATE SEQUENCE public.pelicula_peliculaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.pelicula_peliculaid_seq OWNER TO postgres;

ALTER SEQUENCE public.pelicula_peliculaid_seq OWNED BY public.pelicula.peliculaid;

CREATE TABLE public.renta (
    rentaid integer NOT NULL,
    renta_clienteid integer NOT NULL,
    renta_empleadoid integer NOT NULL,
    renta_peliculaid integer NOT NULL,
    fecha_alquiler timestamp without time zone NOT NULL,
    fecha_devolucion timestamp without time zone,
    cantidad_pago double precision NOT NULL
);

ALTER TABLE public.renta OWNER TO postgres;

CREATE SEQUENCE public.renta_rentaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.renta_rentaid_seq OWNER TO postgres;

ALTER SEQUENCE public.renta_rentaid_seq OWNED BY public.renta.rentaid;

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

CREATE TABLE public.tienda (
    tiendaid integer NOT NULL,
    jefe character varying(40) NOT NULL,
    direccion character varying(30) NOT NULL,
    nombre character varying(35) NOT NULL
);

ALTER TABLE public.tienda OWNER TO postgres;

CREATE TABLE public.tienda_pelicula (
    tiendas_peliculaid integer NOT NULL,
    tienda_peliculaid integer NOT NULL,
    tienda_tiendaid integer NOT NULL,
    cantidad integer
);

ALTER TABLE public.tienda_pelicula OWNER TO postgres;

CREATE SEQUENCE public.tienda_pelicula_tiendas_peliculaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.tienda_pelicula_tiendas_peliculaid_seq OWNER TO postgres;

ALTER SEQUENCE public.tienda_pelicula_tiendas_peliculaid_seq OWNED BY public.tienda_pelicula.tiendas_peliculaid;

CREATE SEQUENCE public.tienda_tiendaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.tienda_tiendaid_seq OWNER TO postgres;

ALTER SEQUENCE public.tienda_tiendaid_seq OWNED BY public.tienda.tiendaid;

ALTER TABLE ONLY public.actor ALTER COLUMN actorid SET DEFAULT nextval('public.actor_actorid_seq'::regclass);

ALTER TABLE ONLY public.actor_pelicula ALTER COLUMN actors_peliculaid SET DEFAULT nextval('public.actor_pelicula_actors_peliculaid_seq'::regclass);

ALTER TABLE ONLY public.categoria ALTER COLUMN categoriaid SET DEFAULT nextval('public.categoria_categoriaid_seq'::regclass);

ALTER TABLE ONLY public.categorias_peliculas ALTER COLUMN categorias_peliculasid SET DEFAULT nextval('public.categorias_peliculas_categorias_peliculasid_seq'::regclass);

ALTER TABLE ONLY public.ciudad ALTER COLUMN ciudadid SET DEFAULT nextval('public.ciudad_ciudadid_seq'::regclass);

ALTER TABLE ONLY public.cliente ALTER COLUMN clienteid SET DEFAULT nextval('public.cliente_clienteid_seq'::regclass);

ALTER TABLE ONLY public.empleado ALTER COLUMN empleadoid SET DEFAULT nextval('public.empleado_empleadoid_seq'::regclass);

ALTER TABLE ONLY public.idioma ALTER COLUMN idiomaid SET DEFAULT nextval('public.idioma_idiomaid_seq'::regclass);

ALTER TABLE ONLY public.idioma_pelicula ALTER COLUMN idiomas_peliculaid SET DEFAULT nextval('public.idioma_pelicula_idiomas_peliculaid_seq'::regclass);

ALTER TABLE ONLY public.pais ALTER COLUMN paisid SET DEFAULT nextval('public.pais_paisid_seq'::regclass);

ALTER TABLE ONLY public.pelicula ALTER COLUMN peliculaid SET DEFAULT nextval('public.pelicula_peliculaid_seq'::regclass);

ALTER TABLE ONLY public.renta ALTER COLUMN rentaid SET DEFAULT nextval('public.renta_rentaid_seq'::regclass);

ALTER TABLE ONLY public.tienda ALTER COLUMN tiendaid SET DEFAULT nextval('public.tienda_tiendaid_seq'::regclass);

ALTER TABLE ONLY public.tienda_pelicula ALTER COLUMN tiendas_peliculaid SET DEFAULT nextval('public.tienda_pelicula_tiendas_peliculaid_seq'::regclass);

ALTER TABLE ONLY public.actor_pelicula
    ADD CONSTRAINT actor_pelicula_pkey PRIMARY KEY (actors_peliculaid);

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actorid);

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (categoriaid);

ALTER TABLE ONLY public.categorias_peliculas
    ADD CONSTRAINT categorias_peliculas_pkey PRIMARY KEY (categorias_peliculasid);

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (ciudadid);

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (clienteid);

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (empleadoid);

ALTER TABLE ONLY public.idioma_pelicula
    ADD CONSTRAINT idioma_pelicula_pkey PRIMARY KEY (idiomas_peliculaid);

ALTER TABLE ONLY public.idioma
    ADD CONSTRAINT idioma_pkey PRIMARY KEY (idiomaid);

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (paisid);

ALTER TABLE ONLY public.pelicula
    ADD CONSTRAINT pelicula_pkey PRIMARY KEY (peliculaid);

ALTER TABLE ONLY public.renta
    ADD CONSTRAINT renta_pkey PRIMARY KEY (rentaid);

ALTER TABLE ONLY public.tienda_pelicula
    ADD CONSTRAINT tienda_pelicula_pkey PRIMARY KEY (tiendas_peliculaid);

ALTER TABLE ONLY public.tienda
    ADD CONSTRAINT tienda_pkey PRIMARY KEY (tiendaid);

ALTER TABLE ONLY public.actor_pelicula
    ADD CONSTRAINT fk_actor FOREIGN KEY (actor_actorid) REFERENCES public.actor(actorid);

ALTER TABLE ONLY public.categorias_peliculas
    ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_categoriaid) REFERENCES public.categoria(categoriaid);

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cliente_c FOREIGN KEY (cliente_ciudadid) REFERENCES public.ciudad(ciudadid);

ALTER TABLE ONLY public.renta
    ADD CONSTRAINT fk_cliente_r FOREIGN KEY (renta_clienteid) REFERENCES public.cliente(clienteid);

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cliente_t FOREIGN KEY (cliente_tiendaid) REFERENCES public.tienda(tiendaid);

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT fk_empleado FOREIGN KEY (empleado_tiendaid) REFERENCES public.tienda(tiendaid);

ALTER TABLE ONLY public.renta
    ADD CONSTRAINT fk_empleado_r FOREIGN KEY (renta_empleadoid) REFERENCES public.empleado(empleadoid);

ALTER TABLE ONLY public.idioma_pelicula
    ADD CONSTRAINT fk_idioma FOREIGN KEY (idioma_idiomaid) REFERENCES public.idioma(idiomaid);

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_pais FOREIGN KEY (pais_paisid) REFERENCES public.pais(paisid);

ALTER TABLE ONLY public.actor_pelicula
    ADD CONSTRAINT fk_pelicula_a FOREIGN KEY (actor_peliculaid) REFERENCES public.pelicula(peliculaid);

ALTER TABLE ONLY public.categorias_peliculas
    ADD CONSTRAINT fk_pelicula_c FOREIGN KEY (categoria_peliculasid) REFERENCES public.pelicula(peliculaid);

ALTER TABLE ONLY public.idioma_pelicula
    ADD CONSTRAINT fk_pelicula_i FOREIGN KEY (idioma_peliculaid) REFERENCES public.pelicula(peliculaid);

ALTER TABLE ONLY public.renta
    ADD CONSTRAINT fk_pelicula_r FOREIGN KEY (renta_peliculaid) REFERENCES public.pelicula(peliculaid);

ALTER TABLE ONLY public.tienda_pelicula
    ADD CONSTRAINT fk_pelicula_t FOREIGN KEY (tienda_peliculaid) REFERENCES public.pelicula(peliculaid);

ALTER TABLE ONLY public.tienda_pelicula
    ADD CONSTRAINT fk_tienda FOREIGN KEY (tienda_tiendaid) REFERENCES public.tienda(tiendaid);
