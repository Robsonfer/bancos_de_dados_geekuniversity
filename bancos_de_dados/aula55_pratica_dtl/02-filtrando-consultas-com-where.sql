CREATE DATABASE secao05;

USE secao05;

CREATE TABLE tipos_produto(
	codigo INT NOT NULL AUTO_INCREMENT,
	descricao VARCHAR(30) NOT NULL,
	PRIMARY KEY (codigo)
);

CREATE TABLE produtos(
	codigo INT NOT NULL AUTO_INCREMENT, 
	descricao VARCHAR(30) NOT NULL,
	preco DECIMAL(8,2) NOT NULL,
	codigo_tipo int NOT NULL,
	PRIMARY KEY (codigo),
	FOREIGN KEY (codigo_tipo) REFERENCES tipos_produto(codigo)
);


INSERT INTO tipos_produto (descricao) VALUES ('Computador');
INSERT INTO tipos_produto (descricao) VALUES ('Impressora');

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', '1200', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Laptop', '1800', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Jato Tinta', '300', 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Laser', '500', 2);

-- Select
SELECT * FROM produtos;

SELECT * FROM tipos_produto;

SELECT * FROM produtos WHERE codigo_tipo = 1;

SELECT * FROM produtos WHERE codigo_tipo = 2;

SELECT * FROM produtos WHERE codigo_tipo = 2 AND preco > 400;

SELECT * FROM produtos WHERE codigo_tipo = 2 AND preco < 400;

SELECT * FROM tipos_produto WHERE codigo = 1;

SELECT * FROM tipos_produto WHERE codigo = 2;

SELECT codigo, descricao FROM tipos_produto WHERE codigo = 2;

SELECT * FROM produtos WHERE descricao = 'Laptop';

SELECT codigo, descricao, codigo_tipo FROM produtos WHERE preco <= 500;

------------------------------------------------------------------------------------------------------------------------

## AULA 56 - SEÇÃO 5 Parte 2 - Consultas em Múltiplas tabelas:

SELECT * FROM tipos_produto;
SELECT * FROM produtos;

-- Consulta em múltiplas tabelas.
SELECT p.codigo AS 'Código', p.descricao AS 'Descrição Produto', p.preco AS 'Preço', tp.descricao AS 'Tipo Produto'
	FROM produtos AS p, tipos_produto AS tp WHERE p.codigo_tipo = tp.codigo;

------------------------------------------------------------------------------------------------------------------------

## AULA 57 - SEÇÃO 5 Parte 3 - Junção de tabelas:

-- Criando e alimentando o banco de dados antes das junções:

CREATE DATABASE juncao;

USE juncao;

CREATE TABLE profissoes(
	id INT NOT NULL AUTO_INCREMENT,
    cargo VARCHAR(60) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(10) NOT NULL,
    id_profissao INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_profissao) REFERENCES profissoes(id)
);

CREATE TABLE consumidor(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    contato VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep VARCHAR(20) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

INSERT INTO profissoes (cargo) VALUES ('Programador');
INSERT INTO profissoes (cargo) VALUES ('Analista de Sistemas');
INSERT INTO profissoes (cargo) VALUES ('Suporte');
INSERT INTO profissoes (cargo) VALUES ('Gerente');

INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('João Pereira', '1981-06-15', '1234-5688', 1);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Ricardo da Silva', '1973-10-10', '2234-5669', 2);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Felipe Oliveira', '1987-08-01', '4234-5640', 3);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Mário Pires', '1991-02-05', '5234-5621', 1);

INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Alfredo Nunes', 'Marta Nunes', 'Rua da paz, 47', 'São Paulo', '123.456-87', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Ana Trujillo', 'Guilherme Souza', 'Rua Dourada, 452', 'Goiânia', '232.984-23', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Leandro Veloz', 'Pdro Siqueira', 'Rua Vazia, 72', 'São Paulo', '936.738-23', 'Brasil');

-- Junção de Produto cartesiano:
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo AS 'Profissão'
	FROM clientes AS c, profissoes AS p
    WHERE c.id_profissao = p.id;

-- Junção Interna (Inner Join):
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c INNER JOIN profissoes AS p
    ON c.id_profissao = p.id;

-- Junção Externa Esquerda (Left Outer Join):
SELECT * FROM clientes
LEFT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;

-- Junção Externa Direita (Right Outer Join):
SELECT * FROM clientes
RIGHT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;

-- Junção Externa Completa (Full Outer Join) NÃO FUNCIONA NO MY SQL:
# SELECT * FROM clientes
# FULL OUTER JOIN profissoes
# ON clientes.id_profissao = profissoes.id;

-- Opção para fazer um Full Outer Join no MySQL:
SELECT * FROM clientes
LEFT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id
UNION
SELECT * FROM clientes
RIGHT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;

-- Junção Cruzada (Cross Join):
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
FROM clientes AS c
CROSS JOIN profissoes AS p;

-- Auto Junção (Self Join):
SELECT a.nome AS Consumidor1, b.nome AS Consumidor2, a.cidade
FROM consumidor AS a
INNER JOIN consumidor AS b
ON a.id <> b.id
AND a.cidade = b.cidade;
