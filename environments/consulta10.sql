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
