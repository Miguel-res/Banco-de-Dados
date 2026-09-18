create database loja;
use loja;

create table cliente(
	id_cliente numeric(1) primary key,	
	nome_cliente varchar(40),
	cidade varchar(40),
	idade numeric(2)
);

create table pedido(
	id_pedido numeric(1) primary key,
	id_cliente numeric(1) references cliente,
	data_pedido date,
	valor numeric(8,2)
);

create table categoria(
	id_categoria numeric(1) primary key,
	nome_categoria varchar(40)
);

create table produto(
	id_produto numeric(1) primary key,
	nome_produto varchar(40),
	preco numeric(8,2),
	id_categoria numeric(1) references categoria,
	estoque numeric(4)
);

insert into cliente values(1, 'Carlos', 'São Paulo', 35),
						  (2, 'Maria', 'Rio de Janeiro', 28),
						  (3, 'João', 'Belo Horizonte', 42);

insert into pedido values(1, 1, '2026-09-01', 1500.00),
                         (2, 1, '2026-09-03', 500.00),
						 (3, 2, '2026-09-05', 800.00);

insert into categoria values(1, 'Eletrônicos'),
                            (2, 'Móveis'),
							(3, 'Livros');

insert into produto values(1, 'Notebook', 3500.00, 1, 10),
                          (2, 'Smartphone', 2500.00, 1, 15),
						  (3, 'Cadeira', 700.00, 2, 20);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Clientes que possuem pedidos.
-- Utilizando uma subquery, liste os nomes dos clientes que possuem pelo menos um pedido cadastrado.
-- Resultado esperado: Carlos e Maria.

select nome_cliente from cliente where id_cliente in (select id_cliente from pedido);

-- 2. Clientes que não possuem pedidos
-- Utilizando uma subquery, liste os nomes dos clientes que nunca realizaram um pedido.
-- Resultado esperado: João.

select nome_cliente from cliente where id_cliente not in (select id_cliente from pedido);

-- 3. Pedidos acima da média
-- Liste os pedidos cujo valor seja maior que a média de todos os pedidos cadastrados.
-- Apresente:
-- ID do pedido
-- ID do cliente
-- Valor

select id_pedido, id_cliente, valor from pedido where valor > (select avg(valor)from pedido);

-- 4. Clientes com pedido acima de R$ 1.000
-- Liste os nomes dos clientes que possuem pelo menos um pedido com valor superior a R$ 1.000,00.
-- Resultado esperado: Carlos.

select nome_cliente from cliente where id_cliente in (select id_cliente from pedido where valor > 1000.00);

-- 5. Produto mais caro
-- Utilizando uma subquery, liste o nome e o preço do produto que possui o maior preço cadastrado.
-- Resultado esperado: Notebook — R$ 3.500,00.

select nome_produto, preco from produto where preco = (select max(preco) from produto)

-- 6. Produtos acima da média
-- Liste os produtos cujo preço seja maior que a média de preços de todos os produtos.
-- Apresente:
-- Nome do produto
-- Preço

select nome_produto, preco from produto where preco > (select avg(preco) from produto)

-- 7. Produtos da categoria Eletrônicos
-- Utilizando uma subquery, liste os produtos que pertencem à categoria Eletrônicos.
-- Resultado esperado:
-- Notebook
-- Smartphone
-- Regra: não utilize JOIN.

select nome_produto from produto where id_categoria in (select id_categoria from categoria where id_categoria = 1);

-- 8. Total gasto por Carlos
-- Utilizando uma subquery, descubra o valor total gasto por Carlos em seus pedidos.
-- O resultado deve apresentar apenas o valor total.
-- Resultado esperado: R$ 2.000,00.

select sum(valor) as 'Compras do Carlos' from pedido where id_cliente in (select id_cliente from pedido where id_cliente = 1);

-- 9. Clientes que gastaram mais que Maria
-- Utilizando subquery, liste os clientes cujo total gasto em pedidos seja maior que o total gasto por Maria.
-- Apresente:
-- Nome do cliente
-- Total gasto
-- Resultado esperado: Carlos — R$ 2.000,00.



-- 10. Cliente que fez o maior pedido
-- Utilizando subqueries e sem JOIN, descubra o nome do cliente responsável pelo pedido de maior valor.
-- Resultado esperado: Carlos.


