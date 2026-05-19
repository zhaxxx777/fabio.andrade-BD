create database grogu;
use grogu;
CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(100)
);

INSERT INTO produtos (nome, sobrenome) VALUES
('Processador', 'Intel Core i9-13900K'),
('Memoria', 'Corsair Vengeance LPX 16GB DDR4'),
('Placa de Vídeo', 'NVIDIA GeForce RTX 4090'),
('Processador', 'AMD Ryzen 9 7950X'),
('Memoria', 'G.Skill Trident Z5 32GB DDR5'),
('Placa de Vídeo', 'AMD Radeon RX 7900 XTX'),
('Processador', 'Intel Core i7-13700K'),
('Memoria', 'Kingston FURY Beast 8GB DDR4'),
('Placa de Vídeo', 'NVIDIA GeForce RTX 4080'),
('Processador', 'AMD Ryzen 7 7800X3D');

INSERT INTO produtos (nome, sobrenome) VALUES 
('Processador', 'Intel i9'), ('Memoria', 'DDR4 16GB'), ('Placa de Vídeo', 'RTX 4070'),
('Processador', 'AMD Ryzen 7'), ('Memoria', 'DDR5 32GB'), ('Placa de Vídeo', 'RX 7800'),
('Processador', 'Intel i5'), ('Memoria', 'HyperX 8GB'), ('Placa de Vídeo', 'RTX 3060'),
('Processador', 'AMD Ryzen 5'), ('Memoria', 'Crucial 4GB'), ('Placa de Vídeo', 'GTX 1650');

INSERT INTO produtos (nome, sobrenome)
SELECT nome, sobrenome FROM produtos
CROSS JOIN (SELECT 1 UNION SELECT 2 UNION SELECT 3) AS t1
CROSS JOIN (SELECT 1 UNION SELECT 2 UNION SELECT 3) AS t2
LIMIT 1000;