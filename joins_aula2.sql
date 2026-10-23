create database juncao;
use juncao;
create table cargo(
	id_cargo int primary key identity,
	nm_cargo varchar(50) not null unique,
	salario numeric(10,2)
);

create table funcionario(
	id_fun int primary key identity,
	nm_fun varchar(50) not null,
	fk_cargo int references cargo);
	
	insert into cargo values 
	('Programador Java',10000),
	('Adm Banco de Dados', 15000),
	('Estagiário(a)', 3890),
	('Técnico de Segurança',9800);
	
	insert into funcionario values 
	('Sandra',1),
	('Marcio',1),
	('Estela',2),
	('Flávio',3),
	('Alessandra',null);
	select * from cargo;
	select * from funcionario;
-- Junção do tipo equivalente ou por igualdade inner join
select nm_fun, nm_cargo from funcionario inner join cargo on id_cargo = fk_cargo;

-- Junção do tipo diferença + equivalencia left join ou right join
select nm_fun, nm_cargo from funcionario left join cargo
on id_cargo = fk_cargo;
select nm_fun, nm_cargo from funcionario right join cargo on id_cargo = fk_cargo;

-- Junção do tipo diferença left join ou right join 
-- + fk null
select nm_fun, nm_cargo from funcionario 
left join cargo on id_cargo = fk_cargo
where fk_cargo is null;

select nm_fun, nm_cargo from funcionario right join cargo on id_cargo = fk_cargo
where fk_cargo is null;