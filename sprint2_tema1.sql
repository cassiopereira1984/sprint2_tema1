/*1 Lista el nombre de todos los productos que hay en la mesa "producto".*/
select nombre from producto;
/*2. Lista los nombres y precios de todos los productos de la tabla "producto".*/
select nombre, precio from producto;
/*3. Lista todas las columnas de la tabla "producto".*/
select * from producto;
/*4. Lista el nombre de los "productos", el precio en euros y el precio en dólares estadounidenses (USD).*/
SELECT  nombre, precio, precio * 1.09 as precioUSD from producto;
/*5. Lista el nombre de los "productos", el precio en euros y el precio en dólares estadounidenses. Utiliza los siguientes sobrenombre para las columnas: nombre de "producto", euros, dólares estadounidenses.*/
SELECT  nombre as nombre_de_producto, precio as euros, precio * 1.09 as dólares_estadonidenses from producto;
/*6. Lista los nombres y precios de todos los productos de la tabla "producto", convirtiendo los nombres a mayúscula.*/
select upper(nombre), precio from producto;
/*7. Lista los nombres y precios de todos los productos de la tabla "producto", convirtiendo los nombres a minúscula.*/
select lower(nombre), precio from producto;
/*8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.*/
select substring(upper(nombre), 1, 2) as Sig, nombre  from fabricante;
/*9. Lista los nombres y precios de todos los productos de la mesa "producto", redondeando el valor del precio.*/
select nombre, ceil(precio) from producto;
/*10. Lista los nombres y precios de todos los productos de la tabla "producto", truncando el valor del precio para mostrarlo sin ninguna cifra decimal.*/
select nombre, truncate(precio, 0) from producto;
/*11. Lista el código de los fabricantes que tienen productos en la mesa "producto".*/
select codigo_fabricante, nombre from producto;
/*12. Lista el código de los fabricantes que tienen productos en la mesa "producto", eliminando los códigos que aparecen repetidos.*/
select distinct codigo_fabricante, nombre from producto;
/*13. Lista los nombres de los fabricantes ordenados de forma ascendente.*/
select nombre from fabricante order by nombre asc;
/*14. Lista los nombres de los fabricantes ordenados de forma descendente.*/
select nombre from fabricante order by nombre desc;
/*15. Lista los nombres de los productos ordenados, en primer lugar, por el nombre de forma ascendente y, en segundo lugar, por el precio de forma descendente.*/
select nombre, precio from producto order by nombre asc, precio desc;
/*16. Devuelve una lista con las 5 primeras filas de la mesa "fabricante".*/
select * from fabricante limit 5;
/*17. Devuelve una lista con 2 filas a partir de la cuarta fila de la mesa "fabricante". La cuarta fila también debe incluirse en la respuesta.*/
select * from fabricante limit 2 offset 3;
/*18. Lista el nombre y precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podrías usar MIN(precio), necesitarías GROUP BY*/
select nombre, precio from producto order by precio asc limit 1;
/*19. Lista el nombre y precio del producto más caro. (Utiliza solamente las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podrías usar MAX(precio), necesitarías GROUP BY.*/
select nombre, precio from producto order by precio desc limit 1;
/*20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.*/
select producto.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.codigo = 2;
/*21. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo;
/*22. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, por orden alfabético.*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by fabricante.nombre asc;
/*23. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.*/
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo;
/*24. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by producto.precio asc limit 1;
/*25. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by producto.precio desc limit 1;
/*26. Devuelve una lista de todos los productos del fabricante Lenovo.*/
select producto.nombre, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = "lenovo";
/*27. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.*/
/*28. Devuelve una lista con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.*/
/*29. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Usando el operador IN.*/
/*30. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.*/
/*31. Devuelve un listado con el nombre y precio de todos los productos de cuyos fabricantes contenga el carácter w en su nombre.*/
/*32. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180 €. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).*/
/*33. Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que tienen productos asociados en la base de datos.*/
/*34. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también a aquellos fabricantes que no tienen productos asociados.*/
/*35. Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.*/
/*36. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
/*37. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
/*38. Lista el nombre del producto más caro del fabricante Lenovo.*/
/*39. Lista el nombre del producto más barato del fabricante Hewlett-Packard.*/
/*40. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.*/
/*41. Lista todos los productos del fabricante Asus que tienen un precio superior al precio*/