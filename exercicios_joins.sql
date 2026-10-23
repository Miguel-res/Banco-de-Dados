Exercícios:
use nosso_sistema;
 
-- 1 - Mostre os clientes e seus pedidos, exiba o nome do cliente com o número do pedido.
select c.nome_clie, p.num_pedido from cliente c inner join pedido p on p.cod_clie = c.cod_clie;

-- 2 - Mostre os vendedores e seus pedidos, exiba o nome do vendedor com o número do pedido.
SELECT V.nome_ven, P.num_pedido FROM Vendedor V INNER JOIN Pedido P ON V.cod_ven = P.cod_ven;


-- 3 - Mostre o nome do cliente, o número do pedido e o nome do vendedor que gerou o pedido.
SELECT C.nome_clie, P.num_pedido, V.nome_ven FROM Cliente C
INNER JOIN Pedido P  ON C.cod_clie = P.cod_clie
INNER JOIN Vendedor V  ON P.cod_ven = V.cod_ven;

-- 4 - Mostre o número do pedido e os produtos descrição que estão neste pedido.
SELECT IP.num_pedido, PR.descricao FROM Item_pedido IP
INNER JOIN Produto PR ON IP.cod_prod = PR.cod_prod;

-- 5 - Mostre os produtos que cada cliente comprou, agrupando pelo nome do cliente.
SELECT C.nome_clie, PR.descricao FROM Cliente C
INNER JOIN Pedido P ON C.cod_clie = P.cod_clie
INNER JOIN Item_pedido IP ON P.num_pedido = IP.num_pedido
INNER JOIN Produto PR ON IP.cod_prod = PR.cod_prod
ORDER BY C.nome_clie;

-- 6 - Quem são os cliente que compraram chocolate, mostre o nome do cliente e a descrição do produto?
SELECT DISTINCT C.nome_clie, PR.descricao FROM Cliente C
INNER JOIN Pedido P ON C.cod_clie = P.cod_clie
INNER JOIN Item_pedido IP ON P.num_pedido = IP.num_pedido
INNER JOIN Produto PR  ON IP.cod_prod = PR.cod_prod
WHERE PR.descricao = 'Chocolate';