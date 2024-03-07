USE bho;

CREATE TABLE api2 AS
SELECT tipo, nombre_peli_api, año_api, mes_api, codigo_imbd, SUM(drama) AS drama, SUM(comedia) AS comedia, SUM(accion) AS accion
FROM intermedia
GROUP BY tipo,
         nombre_peli_api,
         año_api,
         mes_api,
         codigo_imbd;