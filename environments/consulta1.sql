SELECT sum(cantidad) AS Sugar_Wonka 
FROM TIENDA_PELICULA 
INNER JOIN
    PELICULA
ON
    peliculaid = TIENDA_PELICULA.tienda_peliculaid and titulo='SUGAR WONKA'
;
