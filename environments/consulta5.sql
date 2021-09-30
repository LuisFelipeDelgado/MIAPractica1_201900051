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
