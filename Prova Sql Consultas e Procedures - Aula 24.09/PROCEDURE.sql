--15) 
ALTER PROCEDURE InserirAluno @nome varchar (50),
							 @numero int,
							 @tipo int,
							 @curso varchar (3),
							 @dataNasc date
AS
BEGIN

	INSERT INTO ALUNO (Nome, Numero_aluno, Tipo_aluno, Curso, Data_Nascimento)  
	 VALUES(@nome, @numero, @tipo, @curso, @dataNasc);

END

exec InserirAluno 'Joaozao', 19, 1, 'CC', '2004-07-17';

select *
from ALUNO;


--16)
ALTER PROCEDURE AtualizarNota @numero INT,
							  @idTurma INT,
							  @nota CHAR (1)
AS
BEGIN
	
	UPDATE HISTORICO_ESCOLAR
	SET Nota = @nota
	WHERE Identificacao_turma = @idTurma AND Numero_aluno = @numero; 

/*	UPDATE HISTORICO_ESCOLAR
	SET Nota = 'A'
	WHERE Identificacao_turma = 112 AND Numero_aluno = 17; 
AQUI FUNCIONOU, NO ANTERIOR NAO, VOU TESTAR*/
	PRINT 'NOTA ATUALIZADA COM SUCESSO';
END

EXEC AtualizarNota 17, 112 , 'A';

SELECT * 
FROM HISTORICO_ESCOLAR;


--17) 
CREATE PROCEDURE CalcularIdadeAluno @numero INT
									
AS
BEGIN
	DECLARE @idade INT,
			@datanasc date;

	SELECT @idade = YEAR(GETDATE()) - YEAR(A.Data_Nascimento)
	FROM ALUNO AS A
	WHERE A.Numero_aluno = @numero;

	PRINT 'O Aluno de numero ' +CAST(@numero as varchar (50)) + ' tem '+ CAST(@idade as varchar (50))+ ' anos'; 

END

EXEC CalcularIdadeAluno 19;