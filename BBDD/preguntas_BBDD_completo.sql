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

-- ¿Cuál es la mejor serie valorada en IMDB? -- No tenemos series.

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
-- No es el actor real de los Oscar más joven , pero si en relación con nuestras tablas. Ya que por ejemplo Adam Brody y Rami Malek son más jovenes que Casey (nuestro resultado).
SELECT ad.nombre_actor, ad.año_nacimiento
FROM actores_datos AS ad
INNER JOIN oscars AS o ON ad.id_actor = o.id_actor
ORDER BY ad.año_nacimiento ASC
LIMIT 1;





