create database ecommerce;
use ecommerce;
CREATE TABLE cliente(
    id INT PRIMARY KEY IDENTITY,
	nome VARCHAR(100) NOT NULL,
	cidade VARCHAR(50),
	data_nascimento DATE,
	Data_cadastro DATE,
    sexo CHAR(1),
    limite_credito numeric(10,2),
	email VARCHAR(100),
	senha VARCHAR(50)
);

CREATE TABLE produto(
    Id_produto INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco numeric(10,2),
	estoque int,
	data_cadastro date);

CREATE TABLE pedido(
    id_pedido INT PRIMARY KEY IDENTITY,
    valor_total decimal(10,2),
    id_cliente INT,
	data_pedido DATE,
	status varchar(30),
	forma_pagamento varchar(30),
	FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

INSERT INTO cliente
(nome, cidade, data_nascimento, data_cadastro, sexo, limite_credito, email, senha)
VALUES
('João Silva', 'São Paulo', '1990-05-10', '2024-01-15', 'M', 5000.00, 'joao@email.com', '123'),
('Maria Souza', 'Rio de Janeiro', '1988-11-20', '2024-02-10', 'F', 8000.00, 'maria@email.com', '123'),
('Pedro Santos', 'São Paulo', '1995-07-08', '2024-03-05', 'M', 3000.00, 'pedro@email.com', '123'),
('Ana Costa', 'Belo Horizonte', '1992-09-15', '2024-03-20', 'F', 7000.00, 'ana@email.com', '123'),
('Carlos Lima', 'Curitiba', '1985-01-30', '2024-04-12', 'M', 10000.00, 'carlos@email.com', '123');

INSERT INTO produto
(nome, categoria, preco, estoque, data_cadastro)
VALUES
('Notebook Dell', 'Informática', 3500.00, 20, '2024-01-10'),
('Mouse Gamer', 'Informática', 150.00, 100, '2024-01-10'),
('Teclado Mecânico', 'Informática', 300.00, 50, '2024-01-12'),
('Smartphone Samsung', 'Telefonia', 2500.00, 30, '2024-02-05'),
('Fone Bluetooth', 'Telefonia', 200.00, 80, '2024-02-10'),
('Cadeira Gamer', 'Móveis', 1200.00, 15, '2024-03-01');

INSERT INTO pedido
(valor_total, id_cliente, data_pedido, status, forma_pagamento)
VALUES
(3650.00, 1, '2024-05-01', 'Entregue', 'Cartão'),
(2500.00, 2, '2024-05-02', 'Entregue', 'PIX'),
(200.00, 2, '2024-05-05', 'Entregue', 'PIX'),
(1200.00, 3, '2024-05-06', 'Pendente', 'Boleto'),
(3800.00, 1, '2024-05-10', 'Entregue', 'Cartão'),
(150.00, 4, '2024-05-12', 'Cancelado', 'PIX'),
(300.00, 5, '2024-05-15', 'Entregue', 'Cartão'),
(2500.00, 3, '2024-05-18', 'Entregue', 'PIX');

-- 1. Considerando a tabela CLIENTE, escreva uma consulta que apresente o nome dos clientes em letras maiúsculas e sugira uma senha utilizando as 3 primeiras letras do nome concatenado com o ano de nascimento.
select upper(cliente) senha = substring(nome, 1, 3) + substring(data_nascimento, 1, 4) from cliente;

select upper(nome), CONCAT(SUBSTRING(nome, 1, 3), year(data_nascimento)) from cliente;
-- 2. Considerando a tabela PRODUTO, apresente o nome do produto e a quantidade de caracteres existentes no nome.
select nome len(nome) from produto;

select nome, len(nome) from produto;
-- 3. Considerando a tabela PRODUTO, apresente o nome do produto e os 5 primeiros caracteres do nome.
select nome substring(nome,1,5) from produto;

select nome, substring(nome,1,5) from produto;
-- 4. Apresente o nome dos produtos e seus preços, mostrando também o preço com um aumento de 10%.
select nome preco preco*1.1 from produto;

select nome, preco, preco*1.1 from produto;
-- 5. Considerando a tabela CLIENTE, apresente o nome e a quantidade de dias entre a data de cadastro e a data atual.
select nome 'local date time' - data_cadastro from cliente

select nome, datediff(day, Data_cadastro, getdate()) from cliente;
-- 6. Considerando a tabela PEDIDO, calcule o valor total dos pedidos, o maior valor de pedido,
--o menor valor de pedido e o valor médio dos pedidos.
select sum(valor_total) max(valor_total) min(valor_total) avg(valor_total) from pedido;

select sum(valor_total), max(valor_total), min(valor_total), avg(valor_total) from pedido;
-- 7. Apresente a quantidade de pedidos realizados para cada status.
select count(*) from pedido group by status

select status, count(*) from pedido group by status;
-- 8. Na tabela PRODUTO, apresente cada categoria e a quantidade de produtos,
--maior preço, menor preço e preço médio.
select count(*) max(preco) min(preco) avg(preco) from produto group by categoria

select count(*), max(preco), min(preco), avg(preco) from produto group by categoria;
-- 9. Considerando PEDIDO, apresente o status e o valor total dos pedidos de cada status. Exiba somente os grupos cujo valor total seja superior a R$ 5.000,00.
Select status sum(valor_total) from pedido where valor_total=5000 group by status

Select status, sum(valor_total) from pedido group by status having sum(valor_total) > 5000
-- 10. Considerando CLIENTE, apresente nome, data de cadastro e uma nova coluna
--chamada data_renovacao, correspondente à data de cadastro acrescida de 1 ano. 
select nome Data_cadastro Data_cadastro+'0001-00-00' as data_renovação from cliente

select nome, Data_cadastro, dateadd(year, 1, Data_cadastro) as 'data_renovação' from cliente