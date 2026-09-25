use nosso_sistema;

-- Mostre o pedido (número) e a descrição dos produtos que ele tem.

select itp.num_pedido, pr.descricao from Item_pedido itp 
inner join Produto pr on itp.cod_prod = pr.cod_prod order by itp.num_pedido;

-- Crie um relatório que mostre os produtos comprados por cada cliente.

select c.nome_clie, pr.descricao from cliente c
inner join pedido p on c.cod_clie = p.cod_clie
inner join Item_pedido itp on p.num_pedido = itp.num_pedido
inner join Produto pr on itp.cod_prod = pr.cod_prod
order by c.nome_clie;

-- Crie um relatório que mostre os produtos vendidos por cada vendedor.

select p.num_pedido, pr.descricao, v.nome_ven from Vendedor v
inner join pedido p on v.cod_ven = p.cod_ven
inner join Item_pedido itp on p.num_pedido = itp.num_pedido
inner join Produto pr on itp.cod_prod = pr.cod_prod
order by p.num_pedido;

-- Qual cliente comprou chocolate?

select c.nome_clie, pr.descricao from cliente c
inner join pedido p on c.cod_clie = p.cod_clie
inner join Item_pedido itp on p.num_pedido = itp.num_pedido
inner join Produto pr on itp.cod_prod = pr.cod_prod
where pr.cod_prod = 31
order by c.nome_clie; 

-- Qual vendedor vendeu mais chocolate?

select TOP 1 
v.nome_ven, sum(itp.quant) as total from item_pedido itp
inner join pedido p on itp.num_pedido = p.num_pedido
inner join produto prod on prod.cod_prod = itp.cod_prod
inner join vendedor v on v.cod_ven = p.cod_ven
where lower(prod.descricao) = 'chocolate' 
group by v.cod_ven, v.nome_ven
order by total desc