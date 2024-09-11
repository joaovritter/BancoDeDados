DROP PROCEDURE sp_FuncionarioDepartamento;

CREATE PROCEDURE sp_FuncionarioDepartamento 
AS 
BEGIN
	SELECT CONCAT (F.Pnome,' ', F.Minicial,'. ', F.Unome)AS 'Nome', D.Dnome AS 'Departamento'
	FROM FUNCIONARIO AS F
	INNER JOIN DEPARTAMENTO AS D ON F.Dnr = D.Dnumero;
	
END

--Alterando para receber o nome do departamento como parametro
ALTER PROCEDURE sp_FuncionarioDepartamento (@NomeDepartamento VARCHAR (50))
AS
BEGIN
	SELECT CONCAT (F.Pnome,' ', F.Minicial,'. ', F.Unome)AS 'Nome', D.Dnome AS 'Departamento'
	FROM FUNCIONARIO AS F
	INNER JOIN DEPARTAMENTO AS D ON F.Dnr = D.Dnumero
	WHERE D.Dnome = @NomeDepartamento;
END

EXEC sp_FuncionarioDepartamento @NomeDepartamento = 'Pesquisa';