create database Procs;
use procs;
CREATE TABLE Funcionarios (
    Id INT PRIMARY KEY,
    Nome VARCHAR(100),
    Salario DECIMAL(10,2),
    Departamento VARCHAR(50));
    
INSERT INTO Funcionarios (Id, Nome, Salario, Departamento) VALUES
(1, 'Ana', 3500.00, 'Financeiro'),
(2, 'Bruno', 4500.00, 'TI'),
(3, 'Carla', 2800.00, 'RH'),
(4, 'Daniel', 5200.00, 'TI');

exec sp_help funcionarios;

    
CREATE PROCEDURE sp_ListarFuncionarios AS BEGIN
    SELECT Id, Nome, Salario, Departamento  FROM Funcionarios;
END;

exec sp_ListarFuncionarios;

CREATE PROCEDURE sp_ListarPorDepartamento
    @Departamento VARCHAR(50) 
AS BEGIN 
    SELECT Id, Nome, Salario, Departamento FROM Funcionarios 
    WHERE Departamento = @Departamento;
END;

exec sp_ListarPorDepartamento @Departamento = 'TI';
exec sp_ListarPorDepartamento 'RH';
