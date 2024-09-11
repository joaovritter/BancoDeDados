ALTER PROCEDURE sp_AtualizarSalario (@CpfFuncionario VARCHAR(11), @NovoSalario DECIMAL(10,2))
AS
BEGIN	
		UPDATE FUNCIONARIO
		SET Salario = @NovoSalario
		WHERE Cpf = @CpfFuncionario;

		PRINT 'O FUNCIONARIO COM CPF: '  + @CpfFuncionario +' TEM NOVO SALARIO DE: ' + CAST (@NovoSalario AS VARCHAR (15));

	IF @@ROWCOUNT = 0 --Caso nenhuma linha tenha sido alterada
		PRINT 'Cpf Inexistente';
		
	
END

EXEC sp_AtualizarSalario '12345678966', 1000;

SELECT* FROM FUNCIONARIO;