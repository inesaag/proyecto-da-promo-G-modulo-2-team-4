
-- ¿En que año se estrenaron más películas? --

SELECT año_api, tipo ,COUNT(*) AS total_estrenos
FROM api
WHERE tipo = 'pelicula'
GROUP BY año_api, tipo
ORDER BY total_estrenos DESC
LIMIT 1;

-- ¿En que año se estrenaron mas cortos? --
SELECT año_api, tipo ,COUNT(*) AS total_estrenos
FROM api
WHERE tipo = 'corto'
GROUP BY año_api, tipo
ORDER BY total_estrenos DESC
LIMIT 1;


-- ¿Cuál es la película mejor valorada en IMDB?
-- revisar
SELECT nombre_pelicula, puntuacion_imdb
FROM imdb_rt
WHERE puntuacion_imdb = (SELECT MAX(puntuacion_imdb) FROM imdb_rt);



-- ¿Qué actor/actriz ha recibido más Oscars?
SELECT mejor_actor, COUNT(*) AS cantidad_oscar
FROM oscars
GROUP BY mejor_actor
HAVING COUNT(*) = (
					SELECT MAX(total_oscar)
						FROM (
								SELECT COUNT(*) AS total_oscar
									FROM oscars
										GROUP BY mejor_actor
															) AS oscar_actor
);

-- ¿Cual es el actor más jóven en ganar un Óscar ?
-- No es el actor real de los Oscar más joven , pero si en relación con nuestras tablas. 
-- Ya que por ejemplo Adam Brody y Rami Malek son más jovenes que Casey (nuestro resultado).

SELECT ad.nombre_actor, ad.año_nacimiento
FROM actores_datos AS ad
INNER JOIN oscars AS o ON ad.id_actor = o.id_actor
ORDER BY ad.año_nacimiento ASC
LIMIT 1;


-- ¿Qué géneros han recibido más premios Óscar?

WITH generos_premiados AS(
SELECT SUM(api.drama) AS cantidad_dramas, SUM(api.comedia) AS cantidad_comedia, SUM(api.accion) AS cantidad_accion
FROM oscars
LEFT JOIN api
ON oscars.id_pelicula = api.id_pelicula)

SELECT GREATEST(cantidad_dramas, cantidad_comedia, cantidad_accion) AS cantidad,
CASE
        WHEN GREATEST(cantidad_dramas, cantidad_comedia, cantidad_accion) = cantidad_dramas THEN 'drama'
        WHEN GREATEST(cantidad_dramas, cantidad_comedia, cantidad_accion) = cantidad_comedia THEN 'comedia'
        WHEN GREATEST(cantidad_dramas, cantidad_comedia, cantidad_accion) = cantidad_accion THEN 'accion'
    END AS genero
FROM generos_premiados;


-- •	¿Qué actor/actriz ha recibido más Óscar?
-- mejor actor
SELECT mejor_actor, COUNT(*) AS cantidad_oscar
FROM oscars
GROUP BY mejor_actor
HAVING COUNT(*) = (
					SELECT MAX(total_oscar)
						FROM (
								SELECT COUNT(*) AS total_oscar
									FROM oscars
										GROUP BY mejor_actor
															) AS oscar_actor
);

-- mejor actriz
SELECT mejor_actriz, COUNT(*) AS cantidad_oscar
FROM oscars
GROUP BY mejor_actriz
-- •	¿Hay algun actor/actriz que haya recibido más de un premio Óscar?
HAVING COUNT(*) = (
					SELECT MAX(total_oscar)
						FROM (
								SELECT COUNT(*) AS total_oscar
									FROM oscars
										GROUP BY mejor_actriz
															) AS oscar_actriz
);



-- •	¿Hay algun actor/actriz que haya recibido más de un premio Óscar?
-- mejor actor

SELECT mejor_actor, COUNT(*) AS cantidad_oscar
FROM oscars
GROUP BY mejor_actor
HAVING COUNT(*) >1;





-- mejor actriz

SELECT mejor_actriz, COUNT(*) AS cantidad_oscar
FROM oscars
GROUP BY mejor_actriz
HAVING COUNT(*) >1;















