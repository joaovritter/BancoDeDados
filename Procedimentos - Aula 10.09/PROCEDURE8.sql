CREATE PROCEDURE sp_FaixaSalarial
@Salario1 DECIMAL (10,2),
@Salario2 DECIMAL (10,2)
AS
BEGIN
	SELECT *
	FROM FUNCIONARIO
	WHERE Salario BETWEEN @Salario1 AND @Salario2;
END

EXEC sp_FaixaSalarial @Salario1 = 5000, @Salario2 = 35000;