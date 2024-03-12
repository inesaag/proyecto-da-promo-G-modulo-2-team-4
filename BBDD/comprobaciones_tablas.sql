SELECT COUNT(0) from api where codigo_imbd in (SELECT codigo_imbd
FROM api
GROUP BY codigo_imbd
HAVING COUNT(codigo_imbd) > 1);

SELECT codigo_imbd, COUNT(codigo_imbd)
FROM api
GROUP BY codigo_imbd
HAVING COUNT(codigo_imbd) > 1;

select * from api where codigo_imbd = 'tt0331312';