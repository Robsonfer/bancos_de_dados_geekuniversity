## SEÇÃO 4 DML

-- select
SELECT * FROM produtos;
SELECT * FROM tipos_produto;

-- insert
INSERT INTO tipos_produto (descricao) VALUES ('Apple');
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Notebook', '1200', 1);
INSERT INTO produtos VALUES (NULL, 'MacBook Pro', '7200', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('MacBook Air', '8200', 3);

-- update
UPDATE produtos set codigo_tipo = 3 WHERE codigo = 6;
UPDATE produtos set preco = '5200' WHERE codigo = 7;
UPDATE produtos set descricao = 'Impressora Laser', preco = '700' WHERE codigo = 4;
# NUNCA SE ESQUEÇA DE FILTRAR COM O WHERE QUANDO USAR O UPDATE

-- delete
DELETE FROM produtos WHERE codigo = 4;
# NUNCA SE ESQUEÇA DE FILTRAR COM O WHERE QUANDO USAR O DELETE

## SEÇÃO 4 DDL

-- create
CREATE DATABASE meudb;

# ANTES DE CRIAR UMA NOVA TABELA NO BD meudb, PRECISAMOS SELECIONAR O meudb:
USE meudb;
# AGORA JÁ POSSO USAR O CREATE TABLE

CREATE TABLE pessoas(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO pessoas (nome) VALUES ('Felicity Jones');
SELECT * FROM pessoas;

-- alter
ALTER TABLE pessoas ADD ano_nascimento INT;
ALTER TABLE pessoas ADD mes_nascimento INT NOT NULL;
UPDATE pessoas set mes_nascimento = 6 WHERE id = 1;

-- drop
# ESTE COMANDO DELETA ESTRUTURAS COMO TABELAS INTEIRAS OU ATÉ BANCOS DE DADOS INTEIROS!

CREATE TABLE teste(
	id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE teste;