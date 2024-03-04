CREATE SCHEMA BHO;
USE BHO;

CREATE TABLE peliculas (
	id_pelicula int NOT NULL AUTO_INCREMENT,
	nombre_pelicula varchar (200),
	genero enum ('accion','drama','comedia'),
	tipo enum ('pelicula','corto'),
	año_estreno  year,
	mes_estreno int, 
	id_imbd varchar (10),
	puntuacion_imbd float, 
	puntuacion_rt int,
	direccion varchar (100),
	guionistas varchar (200),
	argumento  text,
	duracion_minutos int,
	PRIMARY KEY (id_pelicula)
);

CREATE TABLE actores (
	id_actor int NOT NULL AUTO_INCREMENT,
    nombre_actor varchar (150),
    año_nacimiento year,
    PRIMARY KEY (id_actor)
);

CREATE TABLE peli_actores(
	id_pelicula  int NOT NULL,
    id_actor int NOT NULL, 
    PRIMARY KEY (id_pelicula, id_actor),
	CONSTRAINT fkid_pelicula FOREIGN KEY (id_pelicula)
    REFERENCES peliculas (id_pelicula),
	CONSTRAINT fkid_actor FOREIGN KEY (id_actor)
    REFERENCES actores (id_actor)
);

CREATE TABLE premios_oscar(
	id_pelicula int NOT NULL,
    id_ceremonia int NOT NULL AUTO_INCREMENT, 
    año_ceremonia year,
    mejor_pelicula varchar (200),
    mejor_director varchar (100),
    mejor_actor varchar (150),
    mejor_actriz varchar (150),
    PRIMARY KEY (id_ceremonia),
    CONSTRAINT fkid_pelicula_oscar FOREIGN KEY (id_pelicula)
    REFERENCES peliculas (id_pelicula)
);

