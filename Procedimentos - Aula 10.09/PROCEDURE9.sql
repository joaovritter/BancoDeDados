
ALTER PROCEDURE sp_FuncionarioDepartamento @NomeDepartamento VARCHAR (50)= NULL
AS
BEGIN
	IF @NomeDepartamento IS NULL
	BEGIN	
		SELECT CONCAT (F.Pnome,' ', F.Minicial,'. ', F.Unome)AS 'Nome', D.Dnome AS 'Departamento'
		FROM FUNCIONARIO AS F
		INNER JOIN DEPARTAMENTO AS D ON F.Dnr = D.Dnumero;
	END
	ELSE
	BEGIN	
		SELECT CONCAT (F.Pnome,' ', F.Minicial,'. ', F.Unome)AS 'Nome', D.Dnome AS 'Departamento'
		FROM FUNCIONARIO AS F
		INNER JOIN DEPARTAMENTO AS D ON F.Dnr = D.Dnumero
		WHERE D.Dnome = @NomeDepartamento;
	END
END

EXEC sp_FuncionarioDepartamento @NomeDepartamento = 'Pesquisa';