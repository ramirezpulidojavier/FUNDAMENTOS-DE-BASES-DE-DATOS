r)

SELECT TO_CHAR(fecha, 'yyyy') as Año, TO_CHAR(fecha, 'mm') as Mes, round(AVG(cantidad)) FROM ventas
GROUP BY TO_CHAR(fecha, 'mm'), TO_CHAR(fecha,'yyyy')
ORDER BY TO_CHAR(fecha, 'yyyy'), TO_CHAR(fecha, 'mm');


s)

SELECT codpro, COUNT(*)
FROM ventas
GRUPO BY (codpro) HAVING COUNT (*) > [SELECT COUNT (*) FROM ventas where codpro = 'S1'];


t)

SELECT nompro
	FROM proveedor
			NATURAL JOIN
		ventas
		JOIN
		pieza
			ON pieza.codpie = ventas.codpie
	
	WHERE color = 'Rojo'
	GROUP BY nompro
		HAVING COUNT(*) > 1

u)

SELECT codpro, SUM(cantidad)
FROM ventas
WHERE codpie = 'P1'
GROUP BY (codpro) HAVING SUM(cantidad) = (select Max(cantidad)) FROM
ventas v1 where v1.codpie = 'P1' GROUP BY (codpro))



v)

Los índices aumentan la eficiencia en los accesos a las tablas de las BD pero ralentizan las actualizaciones y ocupan espacio en disco por tener que actualizar tambien cada índice. Por ello, solamente se crean los índices necesarios. Cuando creamos una tabla, Oracler crea automáticamente un índice asociado a la llave primaria de la misma por lo que ni es necesario ni conviene crear índices para llaves primarias, los que de verdad rentan son aquellos que sean útiles en operaciones de consulta habituales. Sin embargo, un cluster proporciona un método alternativo de almacenar información en las tablas, ya que esta formado por un conjunto de estas que se almacenan juntas por compartir campos comunes y se accede frecuentemente a ellas de
forma conjunta. Como los “clusters” almacenan registros relacionados en los mismos bloques de datos, el beneficio obtenido es que mejora el rendimiento en reuniones de las tablas del
clúster, entre otras.

Tras esto, considero más eficiente el uso de clusters ya que no sé si será frecuente la consulta de los datos que me piden consultar como para la creación de índices y porque la información parece estar relacionada o al menos tener campos comunes.
