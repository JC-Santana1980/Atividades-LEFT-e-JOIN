-- Banco do provedor de internet
CREATE DATABASE provedor_left;
USE provedor_left;
 
-- Planos oferecidos
CREATE TABLE plano (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(30) NOT NULL UNIQUE,
  velocidade_mbps INT NOT NULL,
  mensalidade DECIMAL(6,2) NOT NULL
);
 
-- Assinantes: plano_id aponta para plano(id)
CREATE TABLE assinante (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  bairro VARCHAR(40) NOT NULL,
  data_instalacao DATE NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES plano(id)
);
 
INSERT INTO plano (nome, velocidade_mbps, mensalidade) VALUES
  ('Básico', 100, 79.90),
  ('Família', 300, 99.90),
  ('Gamer', 600, 129.90),
  ('Empresarial', 1000, 249.90),
  ('Fibra Rural', 50, 89.90);
 
INSERT INTO assinante (nome, bairro, data_instalacao, plano_id) VALUES
  ('Rita Gomes', 'Centro', '2026-01-15', 2),
  ('Caio Martins', 'Vila Nova', '2026-02-03', 3),
  ('Juliana Reis', 'Centro', '2026-03-20', 1),
  ('Diego Prado', 'Jardim América', '2026-04-08', 3),
  ('Helena Costa', 'Vila Nova', '2026-05-12', 2),
  ('Otávio Lima', 'Centro', '2026-06-30', 2),
  ('Paula Antunes', 'Jardim América', '2026-08-05', 4),
  ('Igor Teixeira', 'Centro', '2026-09-18', 3);


SELECT * FROM plano;
SELECT * FROM assinante;

SELECT plano.*, assinante.* FROM plano LEFT JOIN assinante ON assinante.plano_id = plano.id;
SELECT plano.*, assinante.* FROM plano INNER JOIN assinante ON assinante.plano_id = plano.id; --Plano Fibra Rural nao aparece pois nao tem assinantes
SELECT plano.*, assinante.* FROM plano LEFT JOIN assinante ON assinante.plano_id = plano.id WHERE assinante.plano_id IS NULL;
SELECT plano.nome, COUNT(assinante.plano_id) FROM plano LEFT JOIN assinante ON assinante.plano_id = plano.id GROUP BY plano.nome;
SELECT plano.nome,plano.mensalidade,plano.velocidade_mbps, assinante.nome, assinante.data_instalacao FROM plano LEFT JOIN assinante ON assinante.plano_id = plano.id WHERE plano.mensalidade < '100';