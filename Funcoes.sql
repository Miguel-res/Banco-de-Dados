/*
Funções: uma função tem nome, receber 
um valor ou parâmetro, retorna um resultado
Tipos: numérica, caracter, string, data
Grupos: simples, grupos
*/

--Função numérica simples 
--- round: Arredondar
----sintaxe: round(valor, casas_decimais)

--Desprezar (truncar)
---sintaxe: round(valor, casas_decimais, truncamento)
-- truncamento: desprezar a partir de uma casa decimal especificada
select valor "Valor atual",
       (valor / 0.19) 'Criando casas decimais',
       round(valor / 0.19,2) 'Arredondando',
       round(valor / 0.19,2,1) 'Arredondando'
       from consulta;

       /* Função caracter:
          sintaxe: lower(coluna) - minúsculo
                   upper(coluna) - maiúsculo
                   len(coluna) - conta caracteres
                   substring(coluna, pos. inicial, qtd caracteres)
        */
        select nome, lower(nome), upper(nome), len(nome),
        substring(nome, 4,3)
        from cliente

        -- Exibir os clientes que tenham em seu nome mais que 5 caracteres
        select * from cliente where len(nome) > 10;

        /*Função de grupo: representa o agrupamento de dados gerando
        um relatório mais simples
        
        count(coluna) - conta quantidade
        max(coluna) - retorna o maior valor
        min(coluna) - retorna o menor valor
        sum(coluna) - retorna a soma 
        avg(coluna) - retorna a média
        
        */
        select count(*) from cliente;
         select count(id_cliente) from cliente;
        select max(valor) from consulta
        select sum(valor) from consulta
        select avg(valor) from consulta
        select * from consulta