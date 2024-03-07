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
select upper(nombre), precio from producto
/*7. Lista los nombres y precios de todos los productos de la tabla "producto", convirtiendo los nombres a minúscula.*/
select lower(nombre), precio from producto
/*8.Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.*/
