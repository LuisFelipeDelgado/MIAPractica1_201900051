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
finales AS (SELECT ciudades.PAIS, totales.total as ciudades, ciudades.ciudad, ciudades.count as clientes, trunc(((ciudades.count::decimal*100)/totales.total),2)::float AS PORCENTAJE
FROM ciudades,totales WHERE ciudades.pais = totales.pais
GROUP BY ciudades.pais,ciudades.Ciudad,ciudades.count,totales.total
ORDER BY ciudades.pais
)
SELECT * from finales;
