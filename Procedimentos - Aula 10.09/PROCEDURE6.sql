ALTER PROCEDURE sp_NovoFuncionarioDepartamento 
	@Pnome VARCHAR(15),
    @Minicial CHAR,
    @Unome VARCHAR(15),
    @Cpf CHAR(11),
	@Dnumero INT,
	@Dnome VARCHAR (15)
	
AS
BEGIN
	--inserir departamento
	INSERT INTO DEPARTAMENTO (Dnumero, Dnome)
	VALUES (@Dnumero, @Dnome)

	--inserir funcionario
	INSERT INTO FUNCIONARIO (Pnome, Minicial, Unome, Cpf,Dnr)
	VALUES (@Pnome, @Minicial, @Unome, @Cpf, @Dnumero);

	--colocar novo funcionario como gerente
	UPDATE DEPARTAMENTO
	SET Cpf_gerente = @Cpf, Data_inicio_gerente = GETDATE()
	WHERE Dnumero = @Dnumero;
END

EXEC sp_NovoFuncionarioDepartamento 'Fábio', 'H','Ritter','83424610097',88,'TI';
