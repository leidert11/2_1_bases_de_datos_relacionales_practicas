
create DATABASE if not EXISTS biblioteca;

use biblioteca;

create table libros (
    isbn int 
);

alter table libros modify isbn INT AUTO_INCREMENT not null,
add CONSTRAINT PRIMARY KEY (isbn);

alter table libros add titulo varchar(255) not null;
alter table libros add age int not null;
alter table libros add precio float not null;

create table autores (
    id int
);

alter table autores modify id INT AUTO_INCREMENT not null,
add CONSTRAINT PRIMARY KEY (id);

alter table autores add nombre varchar(255) not null;
alter table autores add direccion varchar(255) not null;

create table editores (
    id int
);

alter table editores modify id INT AUTO_INCREMENT not null,
add CONSTRAINT PRIMARY KEY (id);

alter table editores add nombre varchar(255) not null;
alter table editores add direccion varchar(255) not null;
alter table editores add numero_telefonico int not null;

create table almacenes (
    id int
);

alter table almacenes modify id INT AUTO_INCREMENT not null,
add CONSTRAINT PRIMARY KEY (id);

alter table almacenes add nombre varchar(255) not null;
alter table almacenes add direccion varchar(255) not null;
alter table almacenes add numero_telefonico int not null;

CREATE table libro_in_almacen (
id_libro int not null,
id_almacen int not null,
cantidad_libro int not null
);


create table clientes (
    id int
);

alter table clientes modify id int AUTO_INCREMENT not null,
add CONSTRAINT PRIMARY KEY (id);

alter table clientes add nombre varchar(255) not null;
alter table clientes add correo varchar(100) not null UNIQUE
alter table clientes add direccion varchar(255) not null UNIQUE;
alter table clientes add ciudad varchar(255) not null;
alter table clientes add numero_telefonico int not null;
alter table clientes add tipo_pago int not null;

create table carrito_compras (
    id int
);

alter table carrito_compras modify id int AUTO_INCREMENT not null,
add PRIMARY KEY (id);

alter table carrito_compras add id_cliente int not null;
alter table carrito_compras add id_libro int not null;
alter table carrito_compras add cantidad int not null;
alter table carrito_compras add fecha_compra date not null;

create table orden (
    id int
);

alter table orden modify id int AUTO_INCREMENT not null,
add CONSTRAINT PRIMARY KEY (id);

alter table orden add tipo_compra  int not null;
alter table orden add fecha_orden date not null;
alter table orden add direccion_de_envio varchar(255) not null;
alter table orden add informacion_de_pago varchar(255) not null;

CREATE TABLE autores_libros (
    id_autores INT NOT NULL ,
    id_libro INT NOT NULL 
);

CREATE TABLE editores_libros (
    id_libro INT NOT NULL ,
    id_editor INT NOT NULL 
);

CREATE TABLE cliente_orden (
    id_cliente INT NOT NULL ,
    id_orden INT NOT NULL 
);

CREATE TABLE carrito_orden (
    id_orden INT NOT NULL ,
    id_carrito INT NOT NULL 
);

ALTER TABLE libro_in_almacen ADD CONSTRAINT libro_in_almacen_fk0 FOREIGN KEY (id_libro) REFERENCES libros(isbn);
ALTER TABLE libro_in_almacen ADD CONSTRAINT libro_in_almacen_fk1 FOREIGN KEY (id_almacen) REFERENCES almacenes(id);
ALTER TABLE carrito_compras ADD CONSTRAINT carrito_compras_fk0 FOREIGN KEY (id_cliente) REFERENCES clientes(id);
ALTER TABLE carrito_compras ADD CONSTRAINT carrito_compras_fk1 FOREIGN KEY (id_libro) REFERENCES libros(isbn);
ALTER TABLE autores_libros ADD CONSTRAINT autores_libros_fk0 FOREIGN KEY (id_autores) REFERENCES autores(id);
ALTER TABLE autores_libros ADD CONSTRAINT autores_libros_fk1 FOREIGN KEY (id_libro) REFERENCES libros(isbn);
ALTER TABLE editores_libros ADD CONSTRAINT editores_libros_fk0 FOREIGN KEY (id_libro) REFERENCES libros(isbn);
ALTER TABLE editores_libros ADD CONSTRAINT editores_libros_fk1 FOREIGN KEY (id_editor) REFERENCES editores(id);
ALTER TABLE cliente_orden ADD CONSTRAINT cliente_orden_fk0 FOREIGN KEY (id_cliente) REFERENCES clientes(id);
ALTER TABLE cliente_orden ADD CONSTRAINT cliente_orden_fk1 FOREIGN KEY (id_orden) REFERENCES orden(id);
ALTER TABLE carrito_orden ADD CONSTRAINT carrito_orden_fk0 FOREIGN KEY (id_orden) REFERENCES orden(id);
ALTER TABLE carrito_orden ADD CONSTRAINT carrito_orden_fk1 FOREIGN KEY (id_carrito) REFERENCES carrito_compras(id);
