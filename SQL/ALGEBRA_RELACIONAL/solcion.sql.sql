d)

SELECT DISTINCT nompie FROM ventas NATURAL JOIN pieza (NATURAL JOIN (SELECT codpro FROM proveedor WHERE ciudad='Londres'))

e)

SELECT DISTINCT proveedor.ciudad, proyecto.ciudad FROM ventas NATURAL JOIN proyecto INNER JOIN proveedor ON (proveedor.codpro=ventas.codpro)

f)

SELECT DISTINCT codpie FROM proveedor NATURAL JOIN proyecto NATURAL JOIN ventas

g)

SELECT DISTINCT proyecto.codpj FROM ventas NATURAL JOIN proveedor INNER JOIN proyecto ON (proyecto.codpj=ventas.codpj) WHERE proyecto.ciudad!=proveedor.ciudad

h)

SELECT ciudad FROM pieza
UNION
SELECT ciudad FROM proyecto

i)

SELECT ciudad FROM proveedor
MINUS
SELECT ciudad FROM pieza

j)

SELECT ciudad FROM proveedor
INTERSECT
SELECT ciudad FROM pieza

k)

SELECT DISTINCT codpj FROM ventas NATURAL JOIN (SELECT codpie FROM ventas WHERE ventas.codpro='S1')

l)

SELECT cantidad FROM ventas
MINUS
SELECT ventas.cantidad FROM ventas, ventas vent WHERE ventas.cantidad>vent.cantidad

m)

SELECT codpj FROM proyecto
MINUS
SELECT codpj FROM (SELECT codpro FROM proveedor WHERE ciudad='Londres') NATURAL JOIN ventas NATURAL JOIN (SELECT * FROM pieza WHERE color='Rojo') 

n)

SELECT codpj FROM ventas
MINUS
SELECT codpj FROM (ventas NATURAL JOIN proveedor) WHERE codpro!='S1'