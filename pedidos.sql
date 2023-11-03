CREATE TABLE clientes (
id INT
);

ALTER TABLE clientes 
MODIFY id INT AUTO_INCREMENT NOT NULL,
ADD nombre varchar(255) NOT NULL,
ADD direccion varchar(255) NOT NULL,
ADD telefono varchar(255) NOT NULL,
ADD saldo FLOAT NOT NULL,
ADD PRIMARY KEY (id);

CREATE TABLE pedidos (
id INT
);

ALTER TABLE pedidos 
MODIFY id INT AUTO_INCREMENT NOT NULL,
ADD fecha DATETIME NOT NULL,
ADD PRIMARY KEY (id);

CREATE TABLE productos (
id INT
);

ALTER TABLE productos 
MODIFY id INT AUTO_INCREMENT NOT NULL,
ADD nombre varchar(255) NOT NULL,
ADD precio_actual INT NOT NULL,
ADD stock INT NOT NULL,
ADD proveedor_id INT NOT NULL,
ADD PRIMARY KEY (id);

CREATE TABLE factura (
id INT
);

ALTER TABLE factura 
MODIFY id INT AUTO_INCREMENT NOT NULL,
ADD pedido_id INT NOT NULL,
ADD fecha DATE NOT NULL,
ADD descuento INT NOT NULL,
ADD PRIMARY KEY (id);

CREATE TABLE pago (
id INT
);

ALTER TABLE pago 
MODIFY id INT AUTO_INCREMENT NOT NULL,
ADD factura_id INT NOT NULL,
ADD PRIMARY KEY (id);

CREATE TABLE proveedor (
id INT
);

ALTER TABLE proveedor 
MODIFY id INT AUTO_INCREMENT NOT NULL,
ADD nombre varchar(255) NOT NULL,
ADD direccion varchar(255) NOT NULL,
ADD telefono varchar(255) NOT NULL,
ADD PRIMARY KEY (id);

CREATE TABLE detalle_pedido (
pedido_id INT,
producto_id INT,
cliente_id INT,
cantidad INT
);
