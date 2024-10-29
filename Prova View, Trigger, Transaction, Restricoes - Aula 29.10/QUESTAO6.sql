--6

CREATE TABLE Log_Aluno (
	logId INT IDENTITY(1,1) PRIMARY KEY,
	Numero_aluno INT,
	Operacao VARCHAR (10),
	Data_hora DATETIME DEFAULT GETDATE()
);


CREATE TRIGGER log_aluno_insert
ON ALUNO
AFTER INSERT
AS
BEGIN
	DECLARE @idAluno INT;

	SELECT @idAluno = I.Numero_aluno
	FROM inserted AS I;

	INSERT INTO Log_Aluno (Numero_aluno, operacao)
	VALUES (@idAluno,'INSERT');
END

SELECT * FROM LOG_aluno;

INSERT INTO ALUNO (Nome, Numero_aluno, Tipo_aluno, Curso, Data_Nascimento) VALUES
('Marcelo', 22, 1, 'SI', '2004-07-17');

----------------------------------------------------------------
CREATE TRIGGER log_aluno_update
ON ALUNO
AFTER UPDATE
AS
BEGIN
	DECLARE @idAluno INT;

	SELECT @idAluno = I.Numero_aluno
	FROM inserted AS I;

	INSERT INTO Log_Aluno (Numero_aluno, operacao)
	VALUES (@idAluno,'UPDATE');

END

UPDATE ALUNO
SET Nome = 'Joãozão Bala'
WHERE Numero_aluno = 1;


--------------------------------------------------------------
ALTER TRIGGER log_aluno_delete
ON ALUNO
AFTER DELETE
AS
BEGIN
	DECLARE @idAluno INT;

	SELECT @idAluno = I.Numero_aluno
	FROM inserted AS I;

	INSERT INTO Log_Aluno (Numero_aluno, operacao)
	VALUES (@idAluno,'DELETE');
	
END

DELETE 
FROM ALUNO
WHERE Numero_aluno = 22;

SELECT * FROM ALUNO;

SELECT * FROM Log_Aluno;