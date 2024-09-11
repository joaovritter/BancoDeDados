CREATE PROCEDURE sp_NovoFuncionario 
	@Pnome VARCHAR(15),
    @Minicial CHAR,
    @Unome VARCHAR(15),
    @Cpf CHAR(11)
AS
BEGIN

	INSERT INTO FUNCIONARIO (Pnome, Minicial, Unome, Cpf)
	VALUES (@Pnome, @Minicial, @Unome, @Cpf);
END

EXEC sp_NovoFuncionario 'Joãozão', 'B','ala','02155849028';