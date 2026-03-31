create database chamusca;
use chamuscacontrato;


CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(50),
    endereco VARCHAR(40),
    idade VARCHAR(4)
);


CREATE TABLE empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    endereco VARCHAR(40),
    email VARCHAR(50),
    telefone VARCHAR(20)
);


CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT,
    valor DECIMAL(10, 2),
    quilometragem DECIMAL(10, 2),
    CONSTRAINT fk_veiculo_empresa FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);


CREATE TABLE CONTRATO (
    id_contracto INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_veiculo INT,
    data_devolucao VARCHAR(10),
    valor DECIMAL(10, 2),
    quilometragem_inicial DECIMAL(10, 2),
    CONSTRAINT fk_contrato_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    CONSTRAINT fk_contrato_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);


CREATE TABLE manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT,
    id_cliente INT,
    id_contrato INT,
    valor DECIMAL(10, 2),
    tipo_manutencao VARCHAR(20),
    CONSTRAINT fk_manutencao_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
    CONSTRAINT fk_manutencao_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    CONSTRAINT fk_manutencao_contrato FOREIGN KEY (id_contrato) REFERENCES CONTRATO(id_contracto)
);