/* SUB CONSULTAS, SUBQUERY, SUBQUERIE

Uso de consultas aninhas, ou seja, uso de uma seleção 
dentro de outra.

Por exemplo: Qual o nome do funcionário que ganha maior salário
*/

use nosso_sistema;
select nome_ven from vendedor;
select max(salario_fixo) from vendedor;

select nome_ven, salario_fixo from vendedor 
where salario_fixo = (select max(salario_fixo) from vendedor)

--Funcionarios com salario acima da média
select nome_ven, salario_fixo from vendedor 
where salario_fixo >= (select avg(salario_fixo) from vendedor)

/*
	Imagine duas tabelas
	clientes
	id | nome
	---|------
	1  | João
	2  | Maria
	3  | Pedro
	pedidos
	id | cliente_id | valor
	---|------------|------
	1  | 1          | 100
	2  | 1          | 200
	3  | 2          | 150

	Quero exibir o nome do cliente e o total de pedidos, podemos usar uma subquery
	select nome from cliente;
	select cliente_id, sum(pedido) from pedido group by cliente_id

	SELECT c.nome, (
					SELECT SUM(p.valor)
					FROM PEDIDO p
					WHERE p.cliente_id = c.id
					) as total_pedidos 
	
	from cliente c;

	nome  |  total_pedidos
	João  | 300
	Maria | 150
	Pedro | null

*/