SELECT CLIENTE.NOMBRE AS NOMBRE, CLIENTE.APELLIDO AS APELLIDO, trunc(SUM(cantidad_pago)::decimal,2)::float 
from cliente
INNER JOIN 
    RENTA
ON
    renta_clienteid=clienteid
GROUP BY CLIENTE.NOMBRE, CLIENTE.APELLIDO
HAVING COUNT(*) >= 40;
