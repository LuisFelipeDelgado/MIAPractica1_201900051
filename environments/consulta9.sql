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
