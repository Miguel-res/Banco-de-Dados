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

-- ===========================================
-- RESOLUÇÃO DOS EXERCÍCIOS
-- ===========================================

-- 1 Liste todos os clientes cadastrados.
SELECT * FROM Cliente;

-- 2 Liste todos os animais cadastrados.
SELECT * FROM Animal;

-- 3 Liste todos as consultas cadastrados.
SELECT * FROM Consulta;

-- 4  Mostre os clientes em ordem alfabética de nome.
SELECT * FROM Cliente
ORDER BY nome;

-- 5  Mostre os animais do mais velho para o mais novo.
SELECT * FROM Animal
ORDER BY idade DESC;

-- 6 Liste as consultas da mais barata para a mais cara.
SELECT * FROM Consulta
ORDER BY valor;

-- 7 Mostre os animais cuja espécie seja Cachorro.
SELECT * FROM Animal
WHERE especie='Cachorro';

-- 8 Mostre os clientes que moram na cidade de São Paulo.
SELECT * FROM Cliente
WHERE cidade='São Paulo';

-- 9 Liste os animais que possuem idade maior que 5 anos.

SELECT * FROM Animal
WHERE idade>5;

-- 10 Mostre os clientes que moram em São Paulo OU Campinas.
SELECT * FROM Cliente
WHERE cidade='São Paulo'
OR cidade='Campinas';

-- 11 Mostre os animais que sejam da espécie Gato OU Coelho.
SELECT * FROM Animal
WHERE especie='Gato'
OR especie='Coelho';

-- 12 Liste as consultas com valor maior que R$100 E menor que R$300.
SELECT * FROM Consulta
WHERE valor>100
AND valor<300;

-- 13 Mostre os animais que sejam da espécie Cachorro E tenham mais de 3 anos
SELECT * FROM Animal
WHERE especie='Cachorro'
AND idade>3;

-- 14 Liste os clientes que não moram em São Paulo.
SELECT * FROM Cliente
WHERE NOT cidade='São Paulo';

-- 15  Mostre os animais que não sejam da espécie Cachorro.

SELECT * FROM Animal
WHERE NOT especie='Cachorro';

-- 16  Liste as consultas cujo valor esteja entre R$100 e R$250.
SELECT * FROM Consulta
WHERE valor BETWEEN 100 AND 250;

-- 17 Mostre os animais cuja idade esteja entre 2 e 8 anos.
SELECT * FROM Animal
WHERE idade BETWEEN 2 AND 8;

-- 18 Liste os clientes que moram em São Paulo, Campinas ou Sorocaba.
SELECT * FROM Cliente
WHERE cidade IN ('São Paulo','Campinas','Sorocaba');

-- 19 Mostre os animais cuja espécie seja Cachorro, Gato ou Ave.
SELECT * FROM Animal
WHERE especie IN ('Cachorro','Gato','Ave');

-- 20a Clientes cujo nome começa com a letra A.

SELECT * FROM Cliente
WHERE nome LIKE 'A%';

-- 20b Clientes cujo nome termina com a letra o.
SELECT * FROM Cliente
WHERE nome LIKE '%o';

-- 20c Animais cujo nome contém a letra a.
SELECT * FROM Animal
WHERE nome LIKE '%a%';

-- 20d Clientes cujo nome possui a sequência "an"
SELECT * FROM Cliente
WHERE nome LIKE '%an%';

-- 20e Animais cujo nome termina com "a".
SELECT * FROM Animal
WHERE nome LIKE '%a';

-- 21 Exercício 21 - Liste os animais da espécie Cachorro com idade entre 2 e 8 anos.
SELECT * FROM Animal
WHERE especie = 'cachorro' and idade between 2 and 8;

--Exercício 22 - Liste as consultas com valor entre R$100 e R$300 e diagnóstico diferente de "Vacinação".
select * from Consulta 
where valor between 100 and 300 and diagnostico != 'Vacinação';

--Exercício 23 - Liste os clientes que moram em São Paulo ou Campinas e cujo nome começa com a letra "M".
select * from Cliente
where cidade in('São Paulo', 'Campinas') and nome like 'M%';
