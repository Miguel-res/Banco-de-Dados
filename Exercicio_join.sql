use nosso_sistema;

/*
1 - Mostre os clientes e seus pedidos, exiba o nome do cliente com o número do pedido.
2 - Mostre os vendedores e seus pedidos, exiba o nome do vendedor com o número do pedido.
3 - Mostre o nome do cliente, o número do pedido e o nome do vendedor que gerou o pedido.
4 - Mostre o número do pedido e os produtos descrição que estão neste pedido.
5 - Mostre os produtos que cada cliente comprou, agrupando pelo nome do cliente.
6 - Quem são os cliente que compraram chocolate, mostre o nome do cliente e a descrição do produto?
*/

select * from Cliente;

select c.nome_clie, p.num_pedido from Cliente c inner join Pedido p on c.cod_clie = p.cod_clie;

select v.nome_ven, p.num_pedido from Vendedor v inner join Pedido p on v.cod_ven = p.cod_ven;

select c.nome_clie, pe.num_pedido, pr.descricao from Cliente c 
inner join Pedido pe on c.cod_clie = pe.cod_clie
inner join Item_Pedido itp on pe.num_pedido = itp.num_pedido
right join Produto pr on itp.cod_prod = pr.cod_prod;

select pr.descricao from Cliente c 
inner join Pedido pe on c.cod_clie = pe.cod_clie
inner join Item_Pedido itp on pe.num_pedido = itp.num_pedido
right join Produto pr on itp.cod_prod = pr.cod_prod order by c.nome_clie;

select c.nome_clie, pr.descricao from Cliente c
inner join Pedido pe on c.cod_clie = pe.cod_clie
inner join Item_Pedido itp on pe.num_pedido = itp.num_pedido
right join Produto pr on itp.cod_prod = pr.cod_prod where pr.cod_prod = 31 order by c.nome_clie;