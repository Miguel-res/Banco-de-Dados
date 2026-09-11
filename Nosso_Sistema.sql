-- set - quak eu quero alterar, where- onde eu quer altrerar

create database nosso_sistema;
use nosso_sistema;

create table Cliente(
	cod_clie numeric(4) primary key,
	cnpj char(16),
	cep char(8),
	cidade varchar(15),
	nome_clie varchar(20) not null,
	endereco varchar(30),
	uf char(2),
	ie char(12)
);


create table Pedido(
	num_pedido numeric(4) primary key,
	pr_entrega numeric(3),
	cod_clie numeric(4) references Cliente,
	cod_ven numeric(4) references Vendedor
);
select * from Vendedor;

create table Vendedor(
	cod_ven numeric(4) primary key,
	salario_fixo numeric(10,2),
	comissao char(1),
	nome_ven varchar(20) not null
);


create table Produto(
	cod_prod numeric(4) primary key,
	unidade varchar(3),
	descricao varchar(20),
	val_unit numeric(8,2)
);
select * from Produto

create table Item_pedido(
	num_pedido numeric(4) references Pedido,
	cod_prod numeric(4) references Produto,
	quant numeric(8,2)
);
select * from Item_pedido

insert Cliente values (720, '12113231/0001-34', '24358310', 'Niteroi', 'Ana', 'Rua 17 n.19', 'RJ', '2134')
insert Cliente values (870, '22534126/9387-9', '22763931', 'São Paulo', 'Flávio', 'Av. Pres. Vargas, 10', 'SP', '4631')
insert Cliente values (110, '14512764/9834-9', '30078500', 'Curitiba', 'Jorge', 'Rua Caiapó, 13', 'PR', '')
insert Cliente values (222, '283152123/9348-8', '22124391', 'Belo Horizonte', 'Lúcia', 'Rua Itabira, 123', 'MG', '2985')
insert Cliente values (830, '32816985/7465-6', '3012683 ', 'São Paulo', 'Mauricio', 'Av. Paulista, 1236', 'SP', '9343')
insert Cliente values (130, '23463284/234-9', '30079300', 'Salvador', 'Edmar', 'Rua da Praia, s/n', 'BA', '7121')
insert Cliente values (410, '12835128/2346-9', '30078900', 'Rio de Janeiro', 'Rodolfo', 'Largo da Lapa, 27', 'RJ', '7431')
insert Cliente values (20, '32485126/7326-8', '25679300', 'São Paulo', 'Beth', 'Av. Climério, 45', 'SP', '9280')
insert Cliente values (157, '32848223/324-2', null, 'Londrina', 'Paulo', 'Trav. Moraes, casa 3', 'PR', '1923')
insert Cliente values (180, '12736571/2347-4', '30077500', 'Florianopolis', 'Livio', 'Av. Beira Mar, 1256', 'SC', '1111')
insert Cliente values (260, '21763571/232-9', '30046500', 'Niteroi', 'Susana', 'Rua Lopes Mandes, 12', 'RJ', '2530')
insert Cliente values (290, '13276571/1231-4', '30225900', 'São Paulo', 'Renato', 'Rua Meireles, 123', 'SP', '1820')
insert Cliente values (390, '32176547/213-3', '30438700', 'Uberaba', 'Sebastiao', 'Rua da Igreja, 10 ', 'MG', '9071')
insert Cliente values (234, '21763576/1232-3', '22841650', 'Brasília', 'José', 'Quadra 3, Bl. 3, sl. 1003', 'DF', '2931')
select * from Cliente

insert Vendedor values(209, 1800, 'C', 'Jose')
insert Vendedor values(111, 2490, 'A', 'Carlos')
insert Vendedor values(11, 2780, 'C', 'Joao')
insert Vendedor values(240, 9500, 'C', 'Antonio')
insert Vendedor values(720, 4600, 'A', 'Felipe')
insert Vendedor values(213, 2300, 'A', 'Jonas')
insert Vendedor values(101, 2650, 'C', 'Joao')
insert Vendedor values(310, 870, 'B', 'Josias')
insert Vendedor values(250, 2930, 'B', 'Mauricio')

insert Produto values (25, 'KG', 'Queijo', 0.97);
insert Produto values (31, 'BAR', 'Chocolate', 0.87);
insert Produto values (78, 'L', 'Vinho', 2.00);
insert Produto values (22, 'M', 'Linho', 0.11);
insert Produto values (30, 'SAC', 'Açúcar', 0.30);
insert Produto values (53, 'M', 'Linha', 1.80);
insert Produto values (13, 'G', 'Ouro', 6.18);
insert Produto values (45, 'M', 'Madeira', 0.25);
insert Produto values (87, 'M', 'Cano', 1.97);
insert Produto values (77, 'M', 'Papel', 1.05);
select * from Produto

insert Pedido values (121, 20, 410, 209)
insert Pedido values (97, 20, 720, 101)
insert Pedido values (101, 15, 720, 101)
insert Pedido values (137, 20, 720, 720)
insert Pedido values (148, 20, 720, 101)
insert Pedido values (189, 15, 870, 213)
insert Pedido values (104, 30, 110, 101)
insert Pedido values (203, 30, 830, 250)
insert Pedido values (98, 20, 410, 209)
insert Pedido values (143, 30, 20, 111)
insert Pedido values (105, 30, 180, 240)
insert Pedido values (111, 15, 260, 240)
insert Pedido values (103, 20, 260, 11)
insert Pedido values (91, 20, 260, 11)
insert Pedido values (138, 20, 260, 11)
insert Pedido values (108, 15, 290, 310)
insert Pedido values (119, 30, 390, 250)
insert Pedido values (127, 10, 410, 11)
select * from Pedido

insert Item_pedido values (121, 25, 10);
insert Item_pedido values (121, 31, 35);
insert Item_pedido values (97, 77, 20);
insert Item_pedido values (101, 31, 9);
insert Item_pedido values (101, 78, 18);
insert Item_pedido values (101, 13, 5);
insert Item_pedido values (98, 77, 5);
insert Item_pedido values (148, 45, 8);
insert Item_pedido values (148, 31, 7);
insert Item_pedido values (148, 77, 3);
insert Item_pedido values (148, 25, 10);
insert Item_pedido values (148, 78, 30);
insert Item_pedido values (104, 53, 32);
insert Item_pedido values (203, 31, 6);
insert Item_pedido values (189, 78, 45);
insert Item_pedido values (143, 31, 20);
insert Item_pedido values (143, 78, 10);
select * from Item_pedido

--- ==========================================================================
select * from Vendedor; --- certo
select nome_ven "Nome do Vendedor", comissao "Comissão" from Vendedor; --- certo
select nome_ven "Nome do Vendedor", salario_fixo "Salário" from Vendedor order by salario_fixo; --- certo
select * from Pedido; --- certo
select num_pedido "Pedido", cod_prod "Código do Produto" from Item_pedido order by num_pedido; --- certo
select cod_ven "Vendedor", num_pedido "Pedido" from Pedido order by Vendedor; --- certo
select descricao "Descrição do Produto", val_unit "Preço" from Produto; --- certo
select nome_ven "Nome do Vendedor", comissao "Comissão" from Vendedor order by 2 desc; --- certo
select nome_ven "Nome do Vendedor", salario_fixo "Salário Atual", salario_fixo * 1.15 "Bônus de 15%", salario_fixo - (salario_fixo * 0.05) "Desconto de 5%" from Vendedor; --- meio certo
select nome_ven "Nome", salario_fixo "Salario Atual", salario_fixo + 150 as "Acréscimo de bônus" from Vendedor where Comissao = 'C';

-- =============================================================================

--Exercícios com operadores de banco de dados

-- 1. Exibir o nome e cnpj dos clientes com código maior que 500.
select nome_clie, cnpj from Cliente where cod_clie > 500;

-- 2. Mostrar o nome e salário dos vendedores de comissão "A" ou "B".
select nome_ven, salario_fixo, comissao from Vendedor where comissao = 'A' or comissao = 'B';

--3. Quais produtos (descrição) possuem unidade de medida diferente de "KG"
select * from Produto ;

-- 4. Quais pedidos são do cliente de código 410 e foram realizados pelo vendedor de código 209?
select * from Pedido where cod_clie = 410 and cod_ven = 209;

-- 5. Quais foram os pedidos com prazo de entrega igual a 20, dos vendedores de código 101 e 11?
select * from Pedido where pr_entrega = 20 and cod_ven = 101 or cod_ven = 11;

-- 6. Em quais pedidos existem os produtos 77, 53 e 31?
select * from Item_pedido where cod_prod = 77 or cod_prod = 53 or cod_prod = 31 ;

-- 7. Mostre os clientes com código entre 200 e 800 e que sejam do estado de São Paulo.


-- 8. Indique os produtos do pedido 148.
-- 9. Crie um relatório que mostre os clientes que estão no intervalo de código entre 130 e 390 (inclusive). Ordene pelo código do cliente de forma crescente.
-- 10.  Crie uma lista com os nomes dos clientes que estão no intervalo de "B" até "R" (inclusive).
-- 11.  Exibir o nome do cliente, o estado onde ele mora, desde que morem em: SP, MG e RJ.
-- 12.  Liste a descrição e o preço dos produtos de unidade: 'Bar', 'L' e 'G'.
-- 13.  Mostre os dados dos vendedores de código: 101, 213 e 310.
-- 14.  Mostre os clientes (código e nome) de código: 20 até 180 e 250 até 720.
-- 15.  Mostre os dados dos pedidos que não tenham os produtos: 25, 53 e 78 e possuam os produtos: 77 e 13.
-- 16.  Mostre os clientes (código e nome) de código: 20 até 350 e que morem nos estados de: 'Sp, Mg e Rj'.
-- 17. Nome do cliente terminando com "a" sem preocupação com a quantidade de caracteres.
-- 18. Nome do cliente começando com "a" sem preocupação com a quantidade de caracteres.
-- 19.  Nome do cliente contendo a letra "e" em qualquer posição.
-- 20.  Nome do cliente com a letra "o" na segunda posição.
-- 21.  Nome do cliente com 5 caracteres.
-- 22.  Quais vendedores não possuem a letra "a" em seu nome?
-- 23.  Quais vendedores possuem duas letras "o" em seu nome?
-- 24.  Quais vendedores possuem a penúltima letra do nome a letra "i"?
-- 25. Exibe o nome dos clientes que possuam as letras “o” e “e” em seu nome.


