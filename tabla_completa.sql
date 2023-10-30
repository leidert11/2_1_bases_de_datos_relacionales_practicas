
-- libros

CREATE TABLE libros (
isbn varchar(255) NOT NULL,
titulo varchar(255) NOT NULL,
age year NOT NULL,
precio DECIMAL(10,2) NOT NULL,
PRIMARY KEY (isbn)
);

CREATE TABLE autores (
id INT NOT NULL AUTO_INCREMENT,
nombre varchar(255) NOT NULL,
direccion varchar(255) NOT NULL,
URL varchar(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE editores (
id INT NOT NULL AUTO_INCREMENT UNIQUE,
nombre varchar(255) NOT NULL,
direccion varchar(255) NOT NULL,
numero_telefonico varchar(255) NOT NULL,
URL varchar(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE almacenes (
id int NOT NULL AUTO_INCREMENT,
direccion varchar(255) NOT NULL,
numero_telefonico varchar(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE libro_in_almacen (
id_libro int NOT NULL AUTO_INCREMENT,
id_almacen int NOT NULL AUTO_INCREMENT,
cantidad_libro int NOT NULL
);

CREATE TABLE clientes (
id int NOT NULL AUTO_INCREMENT,
nombre varchar(255) NOT NULL,
direccion varchar(255) NOT NULL,
ciudad varchar(255) NOT NULL,
numero_telefonico varchar(255) NOT NULL,
tipo_pago varchar(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE carrito_compras (
id INT NOT NULL AUTO_INCREMENT,
id_cliente INT NOT NULL,
id_libro INT NOT NULL,
cantidad int NOT NULL,
fecha_compra DATE NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE orden (
id INT NOT NULL AUTO_INCREMENT,
tipo_compra INT NOT NULL,
fecha_orden DATE NOT NULL,
direccion_de_facturacion varchar(255) NOT NULL,
direccion_de_envio varchar(255) NOT NULL,
informacion_de_pago varchar(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE autores_libros (
id_autores INT NOT NULL ,
id_libros INT NOT NULL 
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

ALTER TABLE autores_libros ADD CONSTRAINT autores_libros_fk1 FOREIGN KEY (id_libros) REFERENCES libros(isbn);

ALTER TABLE editores_libros ADD CONSTRAINT editores_libros_fk0 FOREIGN KEY (id_libro) REFERENCES libros(isbn);

ALTER TABLE editores_libros ADD CONSTRAINT editores_libros_fk1 FOREIGN KEY (id_editor) REFERENCES editores(id);

ALTER TABLE cliente_orden ADD CONSTRAINT cliente_orden_fk0 FOREIGN KEY (id_cliente) REFERENCES clientes(id);

ALTER TABLE cliente_orden ADD CONSTRAINT cliente_orden_fk1 FOREIGN KEY (id_orden) REFERENCES orden(id);

ALTER TABLE carrito_orden ADD CONSTRAINT carrito_orden_fk0 FOREIGN KEY (id_orden) REFERENCES orden(id);

ALTER TABLE carrito_orden ADD CONSTRAINT carrito_orden_fk1 FOREIGN KEY (id_carrito) REFERENCES carrito_compras(id);
