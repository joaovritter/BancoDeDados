 --5
CREATE TRIGGER alunos_menores_idade
ON ALUNO
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @datanasc DATE,
			@idade INT

	SELECT @datanasc = I.Data_Nascimento
	FROM inserted AS I;

	SELECT @idade = YEAR(GETDATE())-YEAR(I.Data_Nascimento)
	FROM inserted AS I;

	IF (@idade < 16)
	BEGIN
		RAISERROR ('NAO PODE ADICIONAR GENTE TAO NOVA',16,1);
		ROLLBACK TRANSACTION;
	END

	ELSE
	BEGIN
		INSERT INTO ALUNO 
		SELECT *
		FROM INSERTED;
	END
END

INSERT INTO ALUNO (Nome, Numero_aluno, Tipo_aluno, Curso, Data_Nascimento) VALUES
('Joãozão', 22, 1, 'SI', '2004-07-17');