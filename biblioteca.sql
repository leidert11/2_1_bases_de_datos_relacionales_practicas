
create DATABASE if not EXISTS biblioteca;

use biblioteca;

create table libros (
    isbn int 
);

create table autores (
    id int
);

create table editores (
    id int
);

create table almacenes (
    id int
);

CREATE table libro_in_almacen (
    id int
);

create table clientes (
    id int
);

create table carrito_compras (
    id int
);

create table orden (
    id int
);

