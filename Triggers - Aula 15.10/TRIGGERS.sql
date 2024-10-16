-- Triggers

--1 
ALTER TRIGGER trg_after_insert_funcionario
ON FUNCIONARIO
AFTER INSERT
AS
BEGIN
	DECLARE @Cpf CHAR (11),
			@Pnome VARCHAR (50),
			@Unome VARCHAR (50),
			@Salario DECIMAL (10,2);
	--RECUPERA OS VALORES CONTIDOS NA INSERCAO
	SELECT @Cpf = I.Cpf, @Pnome = I.Pnome, @Unome = I.Unome, @Salario = I.Salario
	FROM inserted AS I;
		
	--EXIBE OS VALORES
	PRINT 'FUNCIONARIO INSERIDO: ';
	PRINT 'CPF: '+@Cpf;
	PRINT 'NOME: ' +@Pnome + ' ' + @Unome;
	PRINT 'SALARIO: ' + CAST(@Salario AS VARCHAR (20));
END;


INSERT INTO FUNCIONARIO (Pnome, Unome, Cpf)
VALUES ('Carlos','Silva', '98765432110');

SELECT * FROM FUNCIONARIO;

----------------------------------------------------------------------------------------------------------------
--2
--TRIGGER COM INSTEAD OF
ALTER TRIGGER trg_insteadof
ON FUNCIONARIO
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @Pnome VARCHAR (50),
			@Unome VARCHAR (50);
	--SETANDO VALORES DAS VARIAVEIS		
	SELECT @Pnome = I.Pnome, @Unome= I.Unome
	FROM inserted AS I;
	--VERIFICAR SE JA EXISTE ALGUM
	IF EXISTS(SELECT 1 FROM FUNCIONARIO AS F WHERE @Pnome = F.Pnome AND @Unome = F.Unome)
		PRINT 'OLA DE NOVO! NAO INSERIR O REGISTRO DESTA VEZ!'
	ELSE 
	BEGIN
		INSERT INTO FUNCIONARIO (Pnome, Unome, Cpf)
		VALUES ('Carlao','Rojao', '45698712365');
		PRINT 'DEU CERTO'
	END
END

INSERT INTO FUNCIONARIO (Pnome, Unome, Cpf)
VALUES ('Carlao','Silva', '98765432110');

SELECT * FROM FUNCIONARIO;

----------------------------------------------------------------------------------------------------------------

--VERIFICAR EXISTENCIA DE TRIGGERS
SELECT * 
FROM sys.triggers
WHERE is_disabled = 0 OR is_disabled = 1;

----------------------------------------------------------------------------------------------------------------

/*ALTER TRIGGER trg_after_autores
ON FUNCIONARIO
AFTER INSERT, UPDATE
AS
IF UPDATE (Pnome)
	BEGIN
	IF EXISTS (SELECT * FROM FUNCIONARIO AS F WHERE F.Cpf = 
	PRINT 'O nome foi alterado'
	END
ELSE
	BEGIN
	INSERT INTO FUNCIONARIO (Pnome, Unome, Cpf)
	VALUES ('Joãozão', 'top', '12345678977');
	PRINT 'Nome nao foi modificado'
	END


UPDATE FUNCIONARIO
SET Pnome = 'Joãozão'
WHERE Cpf = '12345678966';
*/

----------------------------------------------------------------------------------------------------------------
/*Esse trigger deve registrar o CPF do novo funcionário inserido e a operação realizada
(neste caso, "INSERT") em uma tabela de log (Log_Funcionario)
*/
ALTER TRIGGER trg_log_insert_funcionarioON FUNCIONARIOAFTER INSERTASBEGIN	INSERT INTO Log_Funcionario (Cpf, Operacao)	SELECT I.Cpf,'INSERT'	FROM inserted AS I;ENDINSERT INTO FUNCIONARIO (Pnome, Unome, Cpf,Salario)
VALUES ('Juca', 'top', '3221313131', 1200.00);
SELECT * FROM FUNCIONARIO;

----------------------------------------------------------------------------------------------------------------
/*Este trigger deve verificar se o salário do novo funcionário é maior ou igual a R$ 1.000,00*/
alter TRIGGER trg_salario
ON FUNCIONARIO
INSTEAD OF INSERT
AS
BEGIN
BEGIN TRANSACTION;
	DECLARE @Pnome VARCHAR (50),
			@Unome VARCHAR (50),
			@Cpf CHAR (11),
			@Salario DECIMAL (10,2);

	--SETAR OS VALORES DAS VARIAVEIS
	SELECT @Pnome = I.Pnome, @Unome = I.Unome, @Cpf = I.Cpf, @Salario = I.Salario
	FROM inserted AS I
	--VERIFICAR SE O SALARIO É MENOR Q 1000
	IF (@Salario < 1000)
		BEGIN
		ROLLBACK TRANSACTION
		PRINT 'SALARIO MT BAIXO, VAZA'
		RAISERROR ('O SALARIO NAO PODE SER MENOR QUE 1000 PILA ANIMAL',12,1);
		END
	ELSE
		BEGIN
		INSERT INTO FUNCIONARIO (Pnome, Unome, Cpf,Salario)
		VALUES (@Pnome, @Unome, @Cpf, @Salario);
		PRINT 'INSERIDO COM SUCESS'
		COMMIT TRANSACTION
		END
END

INSERT INTO FUNCIONARIO (Pnome, Unome, Cpf,Salario)
VALUES ('Joãozinho', 'Balinha', '11233413131', 9000);

SELECT * FROM FUNCIONARIO;


--55 996277363