/*33. Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que tienen productos asociados en la base de datos.*/
select fabricante.codigo, fabricante.nombre from fabricante

select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where producto.precio >= 180 order by producto.precio desc, producto.nombre asc