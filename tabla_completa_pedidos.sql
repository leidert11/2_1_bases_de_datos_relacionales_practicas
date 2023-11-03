
-- pedidos

CREATE TABLE clientes (
id INT NOT NULL AUTO_INCREMENT,
nombre varchar(255) NOT NULL,
direccion varchar(255) NOT NULL,
telefono varchar(255) NOT NULL,
saldo FLOAT NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE pedidos (
id INT NOT NULL AUTO_INCREMENT,
fecha DATETIME NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE productos (
id INT NOT NULL AUTO_INCREMENT,
nombre varchar(255) NOT NULL,
precio_actual INT NOT NULL,
stock INT NOT NULL,
proveedor_id INT NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE factura (
id INT NOT NULL AUTO_INCREMENT,
pedido_id INT NOT NULL,
fecha DATE NOT NULL,
descuento INT NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE pago (
id INT NOT NULL AUTO_INCREMENT,
factura_id INT NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE proveedor (
id INT NOT NULL AUTO_INCREMENT,
nombre varchar(255) NOT NULL,
direccion varchar(255) NOT NULL,
telefono varchar(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE detalle_pedido (
pedido_id INT NOT NULL,
producto_id INT NOT NULL,
cliente_id INT NOT NULL,
cantidad INT NOT NULL
);

ALTER TABLE productos ADD CONSTRAINT productos_fk0 FOREIGN KEY (proveedor_id) REFERENCES proveedor(id);

ALTER TABLE factura ADD CONSTRAINT factura_fk0 FOREIGN KEY (pedido_id) REFERENCES pedidos(id);

ALTER TABLE pago ADD CONSTRAINT pago_fk0 FOREIGN KEY (factura_id) REFERENCES factura(id);

ALTER TABLE detalle_pedido ADD CONSTRAINT detalle_pedido_fk0 FOREIGN KEY (pedido_id) REFERENCES pedidos(id);

ALTER TABLE detalle_pedido ADD CONSTRAINT detalle_pedido_fk1 FOREIGN KEY (producto_id) REFERENCES productos(id);

ALTER TABLE detalle_pedido ADD CONSTRAINT detalle_pedido_fk2 FOREIGN KEY (cliente_id) REFERENCES clientes(id);
