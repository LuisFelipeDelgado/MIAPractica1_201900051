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
finales AS (SELECT ciudades.PAIS, ciudades.ciudad, trunc((ciudades.count::decimal/totales.total),2)::float AS PROMEDIO
FROM ciudades,totales WHERE ciudades.pais = totales.pais
GROUP BY ciudades.pais,ciudades.Ciudad,ciudades.count,totales.total
)
SELECT * from finales;
