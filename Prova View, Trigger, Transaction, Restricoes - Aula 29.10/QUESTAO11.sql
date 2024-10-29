--11

ALTER VIEW V_Alunos_Curso
AS

SELECT A.Numero_aluno,
	   A.Nome,
	   A.Curso
FROM ALUNO AS A
ORDER BY A.Curso;

SELECT *
FROM V_Alunos_Curso;