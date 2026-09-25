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

create table Pedido(
	num_pedido numeric(4) primary key,
	pr_entrega numeric(3),
	cod_clie numeric(4) references Cliente,
	cod_ven numeric(4) references Vendedor
);


create table Item_pedido(
	num_pedido numeric(4) references Pedido,
	cod_prod numeric(4) references Produto,
	quant numeric(8,2)
);




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