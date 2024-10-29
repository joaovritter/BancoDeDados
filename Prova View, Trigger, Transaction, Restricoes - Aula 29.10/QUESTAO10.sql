--10
ALTER VIEW V_Desempenho_Alunos
AS

SELECT A.Numero_aluno,
	   A.Nome,
	   A.Curso,
	   D.Nome_disciplina,
	   T.Semestre,
	   T.Ano,
	   H.Nota

FROM ALUNO AS A
JOIN HISTORICO_ESCOLAR AS H ON A.Numero_aluno = H.Numero_aluno
JOIN TURMA AS T ON H.Identificacao_turma = T.Identificacao_turma
JOIN DISCIPLINA AS D ON T.Numero_disciplina = D.Numero_disciplina;

SELECT * 
FROM V_Desempenho_Alunos;

/* Organizando para os Joins
HISTORICO_ESCOLAR AS H
	H.NOTA 
	H.ANO
	H.SEMESTRE
DISCIPLINA AS D
	D.NOME_DISCIPLINA

*/