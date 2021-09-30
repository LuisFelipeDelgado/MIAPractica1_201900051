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
finales AS (SELECT sports.PAIS, rentas.count AS total, sports.count AS sports, trunc(((sports.count::decimal*100)/rentas.count),2)::float AS PORCENTAJE
from sports,rentas
WHERE sports.pais = rentas.pais
GROUP BY sports.pais, rentas.count, sports.count
)
SELECT * FROM finales;
