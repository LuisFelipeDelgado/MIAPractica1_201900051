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
