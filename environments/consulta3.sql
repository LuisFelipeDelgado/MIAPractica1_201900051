SELECT NOMBRE || ' ' || APELLIDO as Actor
FROM ACTOR
WHERE ACTOR.APELLIDO LIKE '%son%'
GROUP BY ACTOR.NOMBRE,ACTOR.APELLIDO
ORDER BY ACTOR.NOMBRE
ASC;
