## SEÇÃO 4 DML - Data Manipulation Language

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

## SEÇÃO 4 DDL - Data Definition Language

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

## SEÇÃO 4 DCL - Data Control Language
# GRANT
# REVOKE

## SEÇÃO 4 DTL - Data Transaction Language

SELECT * FROM tipos_produto;

-- Transaction - Inicia uma cadeia de ações:
START TRANSACTION;
	INSERT INTO tipos_produto (descricao) VALUES ('Acessorios');
    INSERT INTO tipos_produto (descricao) VALUES ('Equipamentos');

-- Commit - Efetiva as transactions:
COMMIT;

-- Rollback - Desfaz as transactions:
ROLLBACK;
# Importante: Depois do COMMIT não tem como usar o ROLLBACK!

# Teste de ROLLBACK:
START TRANSACTION;
	INSERT INTO tipos_produto (descricao) VALUES ('Farmacia');
    INSERT INTO tipos_produto (descricao) VALUES ('Escritorio');
ROLLBACK;

# Importante: fazer o START TRANSACTION e não fazer o COMMIT ao fazer o ROLLBACK os ids utilizados são descartados.
# Mas ao escolher os ids descartados, dá certo:
INSERT INTO tipos_produto (codigo, descricao) VALUES (6, 'Outros');
INSERT INTO tipos_produto (codigo, descricao) VALUES (7, 'Diversos');

# Importante: Se criarmos manualmnente um índice, supondo que criamos o índice 20, mesmo que nunca foram criados os 
# índices 8 a 19, ao criar pelo AUTO_INCREMENT os demais índices, o SQL vai trazer o índice 21!



