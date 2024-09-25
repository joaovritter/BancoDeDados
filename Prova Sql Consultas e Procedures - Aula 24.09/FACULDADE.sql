CREATE DATABASE FACULDADE2;
USE FACULDADE2;
DROP DATABASE FACULDADE2;

CREATE TABLE ALUNO (
    Nome NVARCHAR(50),
    Numero_aluno INT PRIMARY KEY,
    Tipo_aluno INT,
    Curso NVARCHAR(3),
    Data_Nascimento DATE
);

CREATE TABLE DISCIPLINA (
    Nome_disciplina NVARCHAR(100),
    Numero_disciplina NVARCHAR(10) PRIMARY KEY,
    Creditos INT,
    Departamento NVARCHAR(10)
);

CREATE TABLE TURMA (
    Identificacao_turma INT PRIMARY KEY,
    Numero_disciplina NVARCHAR(10),
    Semestre NVARCHAR(10),
    Ano INT,
    Professor NVARCHAR(50),
    FOREIGN KEY (Numero_disciplina) REFERENCES DISCIPLINA(Numero_disciplina)
);

CREATE TABLE HISTORICO_ESCOLAR (
    Numero_aluno INT,
    Identificacao_turma INT,
    Nota CHAR(1),
    FOREIGN KEY (Numero_aluno) REFERENCES ALUNO(Numero_aluno),
    FOREIGN KEY (Identificacao_turma) REFERENCES TURMA(Identificacao_turma)
);

CREATE TABLE PRE_REQUISITO (
    Numero_disciplina NVARCHAR(10),
    Numero_pre_requisito NVARCHAR(10),
    FOREIGN KEY (Numero_disciplina) REFERENCES DISCIPLINA(Numero_disciplina),
    FOREIGN KEY (Numero_pre_requisito) REFERENCES DISCIPLINA(Numero_disciplina)
);

INSERT INTO ALUNO (Nome, Numero_aluno, Tipo_aluno, Curso, Data_Nascimento) VALUES
('Silva', 17, 1, 'CC', '1996-06-17'),
('Braga', 8, 2, 'CC', '1997-07-08'),
('Alice Oliveira', 1, 1, 'CC', '1998-02-15'),
('Bruno Fernandes', 2, 2, 'MAT', '1997-11-23'),
('Carla Souza', 3, 1, 'CC', '1999-05-10'),
('Daniel Lima', 4, 2, 'CC', '1998-08-30'),
('Eduardo Pereira', 5, 1, 'MAT', '1997-07-18'),
('Fernanda Costa', 6, 1, 'CC', '1996-12-02'),
('Gabriel Almeida', 7, 2, 'MAT', '1997-03-25'),
('Helena Martins', 9, 1, 'CC', '1999-09-12'),
('Isabela Ribeiro', 10, 2, 'CC', '1998-01-05'),
('João Santos', 11, 1, 'MAT', '1996-04-28');

INSERT INTO DISCIPLINA (Nome_disciplina, Numero_disciplina, Creditos, Departamento) VALUES 
('Introdução à ciência da computação', 'CC1310', 4, 'CC'),
('Estruturas de dados', 'CC3320', 4, 'CC'),
('Matemática discreta', 'MAT2410', 3, 'MAT'),
('Banco de dados', 'CC3380', 3, 'CC');


INSERT INTO TURMA (Identificacao_turma, Numero_disciplina, Semestre, Ano, Professor) VALUES 
(85, 'MAT2410', 'Segundo', 07, 'Kleber'),
(92, 'CC1310', 'Segundo', 07, 'Anderson'),
(102, 'CC3320', 'Primeiro', 08, 'Carlos'),
(112, 'MAT2410', 'Segundo', 08, 'Chang'),
(119, 'CC1310', 'Segundo', 08, 'Anderson'),
(135, 'CC3380', 'Segundo', 08, 'Santos');


INSERT INTO HISTORICO_ESCOLAR (Numero_aluno, Identificacao_turma, Nota) VALUES 
(17, 112, 'B'),
(17, 119, 'C'),
(8, 85, 'A'),
(8, 92, 'A'),
(8, 102, 'B'),
(8, 135, 'A'),
(1, 85, 'A'),  
(1, 92, 'B'),  
(1, 102, 'A'),  
(2, 85, 'C'),  
(2, 92, 'B'),   
(3, 119, 'B'), 
(3, 135, 'F'), 
(3, 112, 'C'), 
(4, 85, 'A'),   
(4, 102, 'F'),  
(5, 135, 'B'),  
(5, 119, 'A'), 
(6, 112, 'C'), 
(6, 85, 'F'),  
(7, 102, 'A'), 
(7, 135, 'F'), 
(9, 119, 'C'), 
(9, 92, 'B'),  
(10, 102, 'F'), 
(10, 85, 'A'); 

INSERT INTO PRE_REQUISITO (Numero_disciplina, Numero_pre_requisito) VALUES 
('CC3380', 'CC3320'),
('CC3380', 'MAT2410'),
('CC3320', 'CC1310');



SELECT *
FROM ALUNO;

SELECT *
FROM DISCIPLINA;

SELECT *
FROM PRE_REQUISITO;

SELECT *
FROM HISTORICO_ESCOLAR
ORDER BY Identificacao_turma;

SELECT *
FROM TURMA;


--8)
SELECT DISTINCT A.Nome, H.Nota, D.Nome_disciplina
FROM HISTORICO_ESCOLAR AS H
JOIN ALUNO AS A ON H.Numero_aluno = A.Numero_aluno
JOIN TURMA AS T ON H.Identificacao_turma = T.Identificacao_turma
JOIN DISCIPLINA AS D ON T.Numero_disciplina = D.Numero_disciplina
WHERE D.Nome_disciplina = 'Banco de Dados';

--9)
SELECT DISTINCT *
FROM DISCIPLINA AS D
JOIN PRE_REQUISITO AS P ON D.Numero_disciplina = D.Numero_disciplina
WHERE P.Numero_disciplina = D.Numero_disciplina;

--10) 
SELECT DISTINCT A.Nome, D.Nome_disciplina AS 'Disciplina', T.Semestre AS 'Semestre', T.Ano AS 'Ano', H.Nota AS 'Nota'
FROM ALUNO AS A
JOIN HISTORICO_ESCOLAR AS H ON A.Numero_aluno = H.Numero_aluno
JOIN TURMA AS T ON H.Identificacao_turma = T.Identificacao_turma
JOIN DISCIPLINA AS D ON T.Numero_disciplina = D.Numero_disciplina
WHERE A.Nome = 'Silva';

--11)
SELECT A.Nome, CONVERT (VARCHAR(15),A.Data_Nascimento, 103)
FROM ALUNO AS A;


--12)
DECLARE @nome VARCHAR (50),
		@nota VARCHAR (2);

IF (@nota = 'A')
	SET @nota = '10';

ELSE IF (@nota = 'B')
	SET @nota = '8';

ELSE IF (@nota = 'C')
	SET @nota = '6';

ELSE IF (@nota = 'D')
	SET @nota = '0';

SELECT DISTINCT @nome = A.Nome, @nota = H.Nota
FROM ALUNO AS A
JOIN HISTORICO_ESCOLAR AS H ON A.Numero_aluno = H.Numero_aluno
JOIN TURMA AS T ON H.Identificacao_turma = T.Identificacao_turma
JOIN DISCIPLINA AS D ON T.Numero_disciplina = D.Numero_disciplina
WHERE A.Nome = @nome;



--13) 
DECLARE @nomeA VARCHAR (50),
		@notaA VARCHAR (2),
		@disciplinaA VARCHAR (50);
SET @nomeA = 'Silva'
SET @disciplinaA = 'Matemática discreta';


SELECT DISTINCT @nomeA = A.Nome, @disciplinaA = D.Nome_disciplina, @notaA = H.Nota
FROM ALUNO AS A
JOIN HISTORICO_ESCOLAR AS H ON A.Numero_aluno = H.Numero_aluno
JOIN TURMA AS T ON H.Identificacao_turma = T.Identificacao_turma
JOIN DISCIPLINA AS D ON T.Numero_disciplina = D.Numero_disciplina
WHERE A.Nome = @nomeA;

IF (@notaA = 'A' OR @notaA = 'B')
PRINT 'Aluno '+ @nomeA + ' Foi aprovado na disciplina de '+ @disciplinaA;

ELSE IF (@notaA = 'C')
PRINT 'Aluno '+ @nomeA + ' Em Recuperacaona disciplina de '+ @disciplinaA;

ELSE IF (@notaA = 'F')
PRINT 'Aluno '+ @nomeA + ' Reprovado na disciplina de '+ @disciplinaA;



--14)
DECLARE @turma VARCHAR (50),
		@identificacao_turma varchar (50),
		@qtdAlunos INT;
SET @turma = 85;
SET @identificacao_turma = '85';

SELECT DISTINCT @qtdAlunos = COUNT (H.Identificacao_turma)
FROM HISTORICO_ESCOLAR AS H
WHERE H.Identificacao_turma = 85;
IF (@qtdAlunos >= 5)
PRINT 'Turma '+ @identificacao_turma+ ' esta completamente lotada, com '+  CAST(@qtdAlunos AS VARCHAR (10)) +' alunos';

ELSE IF (@qtdAlunos = 3 or @qtdAlunos = 4)
PRINT 'Turma '+ @identificacao_turma+ ' esta quase cheia, com '+  CAST(@qtdAlunos AS VARCHAR (10)) +' alunos';

ELSE IF (@qtdAlunos < 3)
PRINT 'Turma '+ @identificacao_turma+ ' esta com vagas, com '+ CAST(@qtdAlunos AS VARCHAR (10))+' alunos';

