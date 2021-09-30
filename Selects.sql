--Consulta 1
SELECT sum(cantidad) AS Sugar_Wonka 
FROM TIENDA_PELICULA 
INNER JOIN
    PELICULA
ON
    peliculaid = TIENDA_PELICULA.tienda_peliculaid and titulo='SUGAR WONKA'
;

--Consulta 2
SELECT CLIENTE.NOMBRE AS NOMBRE, CLIENTE.APELLIDO AS APELLIDO, SUM(cantidad_pago) 
from cliente
INNER JOIN 
    RENTA
ON
    renta_clienteid=clienteid
GROUP BY CLIENTE.NOMBRE, CLIENTE.APELLIDO
HAVING COUNT(*) >= 40;

--Consulta 3
SELECT NOMBRE || ' ' || APELLIDO as Actor
FROM ACTOR
WHERE ACTOR.APELLIDO LIKE '%son%'
GROUP BY ACTOR.NOMBRE,ACTOR.APELLIDO
ORDER BY ACTOR.NOMBRE
ASC;

--Consulta 4
SELECT ACTOR.NOMBRE || ' ' || ACTOR.APELLIDO as Actor, PELICULA.lanzamiento
    from actor_pelicula
    INNER JOIN
        PELICULA
    ON
        PELICULA.peliculaid=actor_peliculaid AND PELICULA.descripcion LIKE '%Shark%' and PELICULA.descripcion LIKE '%Crocodile%'
    INNER JOIN
        ACTOR
    ON
        actorid=actor_actorid
    GROUP BY ACTOR.NOMBRE,ACTOR.APELLIDO,PELICULA.lanzamiento
    ORDER BY ACTOR.APELLIDO
ASC;

--Consulta 5
SELECT  TMP.CLIENTE, TMP.NOMBRE AS PAIS, (TMP.CANTIDAD * 100) / TMP2.CANTIDAD_PAIS AS PROMEDIO
FROM  PAIS, CIUDAD, CLIENTE, 
(SELECT * FROM
    (SELECT  P.paisid, P.NOMBRE, CL.clienteid, CL.NOMBRE || ' ' || CL.APELLIDO AS CLIENTE, COUNT(*) AS CANTIDAD
    FROM  CLIENTE CL, RENTA R, CIUDAD CI, PAIS P
    WHERE CL.clienteid = R.renta_clienteid AND CI.ciudadid = CL.cliente_ciudadid AND CI.pais_paisid = P.paisid
    GROUP BY P.paisid, P.NOMBRE, CL.clienteid, CL.NOMBRE || ' ' || CL.APELLIDO
    ORDER BY CANTIDAD DESC) FOO
limit 1) TMP,
(SELECT paisid, PAIS.NOMBRE, COUNT(*) AS CANTIDAD_PAIS
FROM PAIS, CIUDAD, CLIENTE, RENTA
WHERE PAIS.paisid = CIUDAD.pais_paisid AND CLIENTE.cliente_ciudadid = CIUDAD.ciudadid AND CLIENTE.clienteid = RENTA.renta_clienteid
GROUP BY paisid, PAIS.NOMBRE) TMP2
WHERE PAIS.paisid = CIUDAD.pais_paisid AND CIUDAD.ciudadid = CLIENTE.cliente_ciudadid AND TMP.paisid = PAIS.paisid AND TMP2.paisid = PAIS.paisid;

--Consulta 6
WITH ciudades As(SELECT PAIS.nombre as PAIS,CIUDAD.CIUDAD, COUNT(*) 
from CLIENTE,CIUDAD,PAIS 
WHERE CIUDAD.ciudadid = cliente.cliente_ciudadid
AND CIUDAD.pais_paisid = PAIS.paisid
GROUP BY CIUDAD.CIUDAD,PAIS.NOMBRE
ORDER by PAIS.nombre ASC
),
totales AS (SELECT ciudades.PAIS, SUM(ciudades.count) as total FROM
ciudades GROUP BY ciudades.PAIS
),
finales AS (SELECT ciudades.PAIS, totales.total as ciudades, ciudades.ciudad, ciudades.count as clientes, trunc(((ciudades.count::decimal*100)/totales.total),2) AS PORCENTAJE
FROM ciudades,totales WHERE ciudades.pais = totales.pais
GROUP BY ciudades.pais,ciudades.Ciudad,ciudades.count,totales.total
ORDER BY ciudades.pais
)
SELECT * from finales;

--Consulta 7
WITH ciudades As(SELECT PAIS.nombre as PAIS,CIUDAD.CIUDAD, COUNT(*) 
from RENTA,CLIENTE,CIUDAD,PAIS 
WHERE RENTA.renta_clienteid = CLIENTE.clienteid
AND CIUDAD.ciudadid = cliente.cliente_ciudadid
AND CIUDAD.pais_paisid = PAIS.paisid
GROUP BY CIUDAD.CIUDAD,PAIS.NOMBRE
ORDER by PAIS.nombre ASC
),
totales AS (SELECT ciudades.PAIS, COUNT(*) as total FROM
ciudades GROUP BY ciudades.PAIS
),
finales AS (SELECT ciudades.PAIS, ciudades.ciudad, trunc((ciudades.count::decimal/totales.total),2) AS PROMEDIO
FROM ciudades,totales WHERE ciudades.pais = totales.pais
GROUP BY ciudades.pais,ciudades.Ciudad,ciudades.count,totales.total
)
SELECT * from finales;

--Consulta 8
WITH rentas As(SELECT PAIS.nombre as PAIS, COUNT(*) 
from RENTA,CLIENTE,CIUDAD,PAIS 
WHERE RENTA.renta_clienteid = CLIENTE.clienteid
AND CIUDAD.ciudadid = cliente.cliente_ciudadid
AND CIUDAD.pais_paisid = PAIS.paisid
GROUP BY PAIS.NOMBRE
ORDER by PAIS.nombre ASC
),
sports as (SELECT PAIS.nombre as PAIS, COUNT(*) 
from RENTA,CLIENTE,CIUDAD,PAIS,CATEGORIA,PELICULA,categorias_peliculas
WHERE RENTA.renta_clienteid = CLIENTE.clienteid
AND RENTA.renta_peliculaid = PELICULA.peliculaid
AND CATEGORIA.categoriaid = categorias_peliculas.categoria_categoriaid
AND categorias_peliculas.categoria_peliculasid = PELICULA.peliculaid
AND CATEGORIA.NOMBRE='Sports'
AND CIUDAD.ciudadid = cliente.cliente_ciudadid
AND CIUDAD.pais_paisid = PAIS.paisid
GROUP BY PAIS.NOMBRE
ORDER by PAIS.nombre ASC
),
finales AS (SELECT sports.PAIS, rentas.count AS total, sports.count AS sports, trunc(((sports.count::decimal*100)/rentas.count),2) AS PORCENTAJE
from sports,rentas
WHERE sports.pais = rentas.pais
GROUP BY sports.pais, rentas.count, sports.count
)
SELECT * FROM finales;

--Consulta 9
WITH ciudades As(SELECT CIUDAD.CIUDAD, COUNT(*) 
from RENTA,CLIENTE,CIUDAD,PAIS 
WHERE CIUDAD.CIUDAD <>'Dayton'
AND PAIS.NOMBRE = 'United States'
AND RENTA.renta_clienteid = CLIENTE.clienteid
AND CIUDAD.ciudadid = cliente.cliente_ciudadid
AND CIUDAD.pais_paisid = PAIS.paisid
GROUP BY CIUDAD.CIUDAD
ORDER by count ASC
),
daytons As(SELECT COUNT(*) 
from RENTA,CLIENTE,CIUDAD,PAIS 
WHERE CIUDAD.CIUDAD = 'Dayton'
AND PAIS.NOMBRE = 'United States'
AND RENTA.renta_clienteid = CLIENTE.clienteid
AND CIUDAD.ciudadid = cliente.cliente_ciudadid
AND CIUDAD.pais_paisid = PAIS.paisid
),
finales AS (SELECT ciudades.CIUDAD, ciudades.count AS Rentas
from ciudades,daytons 
GROUP BY ciudades.CIUDAD,ciudades.count,daytons.count
HAVING ciudades.count>daytons.count
ORDER by Rentas ASC
)
select * from finales;

--Consulta 10
WITH horrors as (SELECT PAIS.nombre as PAIS, ciudad.ciudad, COUNT(*) 
from RENTA,CLIENTE,CIUDAD,PAIS,CATEGORIA,PELICULA,categorias_peliculas
WHERE RENTA.renta_clienteid = CLIENTE.clienteid
AND RENTA.renta_peliculaid = PELICULA.peliculaid
AND CATEGORIA.categoriaid = categorias_peliculas.categoria_categoriaid
AND categorias_peliculas.categoria_peliculasid = PELICULA.peliculaid
AND CATEGORIA.NOMBRE='Horror'
AND CIUDAD.ciudadid = cliente.cliente_ciudadid
AND CIUDAD.pais_paisid = PAIS.paisid
GROUP BY PAIS.NOMBRE, ciudad.ciudad
ORDER by PAIS.nombre ASC
),
others as (SELECT PAIS.nombre as PAIS, ciudad.ciudad, categoria.nombre, COUNT(*) 
from RENTA,CLIENTE,CIUDAD,PAIS,CATEGORIA,PELICULA,categorias_peliculas
WHERE RENTA.renta_clienteid = CLIENTE.clienteid
AND RENTA.renta_peliculaid = PELICULA.peliculaid
AND CATEGORIA.categoriaid = categorias_peliculas.categoria_categoriaid
AND categorias_peliculas.categoria_peliculasid = PELICULA.peliculaid
AND CATEGORIA.NOMBRE<>'Horror'
AND CIUDAD.ciudadid = cliente.cliente_ciudadid
AND CIUDAD.pais_paisid = PAIS.paisid
GROUP BY PAIS.NOMBRE, ciudad.ciudad, categoria.nombre
ORDER by PAIS.nombre ASC
),
maximos as (SELECT others.ciudad, MAX(others.count) 
from others
GROUP BY others.ciudad
ORDER by others.ciudad ASC
),
finales As(SELECT horrors.pais as PAIS,horrors.CIUDAD 
from horrors,maximos
WHERE horrors.ciudad = maximos.ciudad
AND horrors.count >= maximos.max
GROUP BY horrors.ciudad,maximos.ciudad,horrors.pais,horrors.count,maximos.max
ORDER by horrors.pais ASC
)
select * from finales;


ALTER TABLE tienda_pelicula 
ADD COLUMN cantidad INT;
ALTER TABLE renta
ALTER COLUMN cantidad_pago TYPE float;
