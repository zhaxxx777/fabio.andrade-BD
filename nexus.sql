CREATE DATABASE nexus_db;
USE nexus_db;

CREATE TABLE categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE produto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf_cnpj VARCHAR(20)
);

CREATE TABLE transportadora (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data DATETIME,
    id_cliente INT,
    id_transportadora INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_transportadora) REFERENCES transportadora(id)
);

CREATE TABLE item_pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id),
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);
INSERT INTO categoria (nome)
VALUES ('Processador'), ('Memória'), ('Placa de Vídeo');

INSERT INTO produto (nome, preco, estoque, id_categoria)
VALUES 
('Ryzen 5 5600X', 1200.00, 10, 1),
('Memória DDR4 16GB', 300.00, 20, 2);

INSERT INTO cliente (nome, cpf_cnpj)
VALUES 
('João Silva', '12345678900'),
('Empresa XYZ', '11222333000199');

INSERT INTO transportadora (nome)
VALUES 
('Correios'),
('Transportadora Rápida');

INSERT INTO pedido (data, id_cliente, id_transportadora)
VALUES 
(NOW(), 1, 1);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES 
(1, 1, 1, 1200.00),
(1, 2, 2, 300.00);

SELECT * FROM cliente;

SELECT pedido.id, cliente.nome, pedido.data
FROM pedido
INNER JOIN cliente
ON pedido.id_cliente = cliente.id;

SELECT cliente.nome, pedido.id
FROM cliente
LEFT OUTER JOIN pedido
ON cliente.id = pedido.id_cliente;


SELECT 
cliente.nome AS cliente,
produto.nome AS produto,
item_pedido.quantidade,
item_pedido.preco_unitario

FROM item_pedido

INNER JOIN pedido
ON item_pedido.id_pedido = pedido.id

INNER JOIN cliente
ON pedido.id_cliente = cliente.id

INNER JOIN produto
ON item_pedido.id_produto = produto.id;