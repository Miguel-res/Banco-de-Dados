-- ===========================================
-- CRIAÇÃO DO BANCO DE DADOS
-- ===========================================

CREATE DATABASE ClinicaVeterinaria;

USE ClinicaVeterinaria;

-- ===========================================
-- CRIAÇÃO DAS TABELAS
-- ===========================================

CREATE TABLE Cliente(
    id_cliente INT IDENTITY PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    cidade VARCHAR(50)
);

CREATE TABLE Animal(
    id_animal INT IDENTITY PRIMARY KEY,
    nome VARCHAR(50),
    especie VARCHAR(30),
    raca VARCHAR(40),
    idade INT,
    id_cliente INT,
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Consulta(
    id_consulta INT IDENTITY PRIMARY KEY,
    data_consulta DATE,
    valor DECIMAL(10,2),
    diagnostico VARCHAR(100),
    id_animal INT,
    FOREIGN KEY(id_animal) REFERENCES Animal(id_animal)
);

-- ===========================================
-- INSERTS CLIENTES
-- ===========================================

INSERT INTO Cliente(nome,telefone,cidade)
VALUES
('Ana Souza','11999990001','São Paulo'),
('Bruno Lima','11999990002','Campinas'),
('Carlos Mendes','11999990003','Sorocaba'),
('Daniela Rocha','11999990004','São Paulo'),
('Eduardo Silva','11999990005','Jundiaí');

-- ===========================================
-- INSERTS ANIMAIS
-- ===========================================

INSERT INTO Animal(nome,especie,raca,idade,id_cliente)
VALUES
('Rex','Cachorro','Labrador',8,1),
('Mimi','Gato','Persa',3,2),
('Luna','Cachorro','Poodle',2,3),
('Pingo','Coelho','Mini Lop',4,4),
('Kiara','Ave','Calopsita',1,5);

-- ===========================================
-- INSERTS CONSULTAS
-- ===========================================

INSERT INTO Consulta(data_consulta,valor,diagnostico,id_animal)
VALUES
('2025-03-10',120.00,'Vacinação',1),
('2025-03-15',250.00,'Infecção',2),
('2025-04-01',180.00,'Check-up',3),
('2025-04-20',90.00,'Corte de unhas',4),
('2025-05-05',320.00,'Cirurgia',5);

-- Exercício 1 - Mostre a quantidade total de clientes cadastrados.

select count(*) from Cliente;

-- Exercício 2 Mostre a quantidade total de animais cadastrados.

select count(*) from Animal;

-- Exercício 3 Mostre a quantidade total de consultas realizadas.

select count(*) from Consulta;

-- Exercício 4 Calcule o valor total arrecadado com todas as consultas.

select sum(valor) from Consulta;

-- Exercício 5 Mostre o valor médio das consultas.

select avg(valor) from Consulta;

-- Exercício 6 Mostre o maior valor registrado em uma consulta.

select max(valor) from Consulta;

-- Exercício 7 Mostre o menor valor registrado em uma consulta.

select min(valor) from Consulta;

-- Exercício 8 Mostre a idade média dos animais cadastrados.

select avg(idade) from Animal;

-- Exercício 9 Mostre a idade do animal mais velho.

select max(idade) from Animal;

-- Exercício 10 Mostre a idade do animal mais novo.

select min(idade) from Animal;

-- Exercício 11 Mostre o nome de cada cliente e a quantidade de caracteres do seu nome.

select nome, len(nome) from Cliente;

-- Exercício 12 Mostre o nome dos animais juntamente com a quantidade de letras do nome.

select nome, len(nome) from Animal;

-- Exercício 13 Mostre os diagnósticos e o tamanho de cada texto.

select diagnostico, len(diagnostico) from Consulta;

-- Exercício 14 Liste apenas os clientes cujo nome possui mais de 10 caracteres.

select * from Cliente where len(nome)>10;

-- Exercício 15 Liste os animais cujo nome possui exatamente 5 caracteres.

select * from Animal where len(nome)=5;

-- Exercício 16 Mostre todos os nomes dos clientes em letras maiúsculas.

select upper(nome) from Cliente;

-- Exercício 17 Mostre os nomes dos animais em letras maiúsculas.

select upper(nome) from Animal;

-- Exercício 18 Mostre os diagnósticos escritos totalmente em letras maiúsculas.

select  upper(diagnostico) from Consulta;

-- Exercício 19 Mostre os nomes dos clientes em letras minúsculas.

select lower(nome) from Cliente;

-- Exercício 20 Mostre a espécie dos animais em letras minúsculas.

select lower(especie) from Animal;

-- Exercício 21 Mostre o nome da raça de todos os animais em letras minúsculas.

select lower(raca) from Animal;

-- Exercício 22 Mostre os três primeiros caracteres do nome de cada cliente.

select substring(nome, 1, 3) from Cliente;

-- Exercício 23 Mostre os quatro primeiros caracteres do nome de cada animal.

select substring(nome, 1, 4) from Animal;


-- Exercício 24 Mostre os cinco primeiros caracteres do diagnóstico de cada consulta.

select substring(diagnostico, 1, 5) from Consulta;


-- Exercício 25 Mostre do segundo ao quinto caractere do nome de cada cliente.

select substring(nome, 2, 4) from Cliente;


-- Exercício 26 Mostre os três primeiros caracteres da cidade dos clientes.

select substring(cidade, 1, 3) from Cliente;

-- Exercício 27 Mostre o valor de cada consulta arredondado para zero casas decimais.

select round(valor, 0) from Consulta;

-- Exercício 28 Mostre a média dos valores das consultas arredondada para duas casas decimais.

select round(valor/5, 0) from Consulta;

-- Exercício 29 Mostre o valor de cada consulta arredondado para uma casa decimal.

select round(valor, 1) from Consulta;

-- Exercício 30 Calcule o valor médio das consultas e apresente o resultado arredondado para zero casas decimais.

select round(valor/5, 0) from Consulta;

-- Exercício 31 Mostre o nome de cada cliente em letras maiúsculas e a quantidade de caracteres do nome.

select upper(nome), len(nome) from Cliente;

-- Exercício 32 Mostre o nome do animal e os três primeiros caracteres do nome.

select nome, substring(nome, 1, 3) from Animal;

-- Exercício 33 Apresente o valor médio das consultas arredondado para duas casas decimais.

select round(valor/5, 2) from Consulta;

-- Exercício 34 Mostre a soma dos valores das consultas e o maior valor registrado.

select sum(valor), max(valor) from Consulta;

-- Exercício 35 Exiba o diagnóstico em letras maiúsculas e informe a quantidade de caracteres do texto.

select upper(diagnostico), len(diagnostico) from Consulta;
