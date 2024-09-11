-- inserir novo funcionario, mas antes verificar se existe um funcionario com o mesmo nome (nome completo)

ALTER PROCEDURE sp_NovoFuncionarioInexistente 
	@Pnome VARCHAR(15),
    @Minicial CHAR,
    @Unome VARCHAR(15),
    @Cpf CHAR(11)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM FUNCIONARIO WHERE Pnome = @Pnome AND Minicial = @Minicial AND Unome = @Unome)
		BEGIN
		PRINT 'FUNCIONARIO COM ESTE NOME JA EXISTE'
		RETURN;
		END
	ELSE
		BEGIN
		INSERT INTO FUNCIONARIO (Pnome, Minicial, Unome, Cpf)
		VALUES (@Pnome, @Minicial, @Unome, @Cpf);
		END
END

EXEC sp_NovoFuncionarioInexistente 'Joãozão', 'B','ala','02155849028';

SELECT * FROM FUNCIONARIO;