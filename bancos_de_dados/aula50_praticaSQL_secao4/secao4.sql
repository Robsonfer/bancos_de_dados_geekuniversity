# DML

-- selec
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
