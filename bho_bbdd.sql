CREATE SCHEMA BHO;
USE BHO;

CREATE TABLE api(
	id_pelicula int NOT NULL AUTO_INCREMENT,
    genero enum ('accion','drama','comedia'),
	tipo enum ('pelicula','corto'),
    nombre_peli_api varchar(200),
    año_api year, 
    mes_api int, 
    codigo_imbd varchar (10),
    PRIMARY KEY (id_pelicula)
);


CREATE TABLE peliculas (
	id_pelicula int NOT NULL,
    puntuacion_imbd float, 
    puntuacion_rt int,
    direccion varchar (100),
	guionistas varchar (200),
	argumento  text,
	duracion_minutos int,
	nombre_pelicula varchar (200),
	codigo_imbd varchar (10),
    CONSTRAINT fkid_pelicula FOREIGN KEY (id_pelicula)
    REFERENCES api (id_pelicula)
);

CREATE TABLE actores (
	id_actor int NOT NULL AUTO_INCREMENT,
    nombre_actor varchar (150),
    año_nacimiento year,
    lugar_nacimiento varchar (200),
    activo_desde year,
    premios varchar (250),
    PRIMARY KEY (id_actor)
);


CREATE TABLE premios_oscar(
	id_pelicula int NOT NULL,
    id_actor int NOT NULL,
    id_actriz int NOT NULL,
    id_ceremonia int NOT NULL AUTO_INCREMENT, 
    año_ceremonia year,
    mejor_pelicula varchar (200),
    mejor_director varchar (100),
    mejor_actor varchar (150),
    mejor_actriz varchar (150),
    PRIMARY KEY (id_ceremonia),
    CONSTRAINT fkid_pelicula_oscar FOREIGN KEY (id_pelicula)
    REFERENCES api (id_pelicula),
	CONSTRAINT fkid_actor FOREIGN KEY (id_actor)
    REFERENCES actores (id_actor),
    CONSTRAINT fkid_actriz FOREIGN KEY (id_actriz)
    REFERENCES actores (id_actor)
);


CREATE TABLE peli_actores(
	id_pelicula  int NOT NULL,
    id_actor int NOT NULL, 
    PRIMARY KEY (id_pelicula, id_actor),
	CONSTRAINT fkid_pelicula2 FOREIGN KEY (id_pelicula)
    REFERENCES api (id_pelicula),
	CONSTRAINT fkid_actor2 FOREIGN KEY (id_actor)
    REFERENCES actores (id_actor)
);



