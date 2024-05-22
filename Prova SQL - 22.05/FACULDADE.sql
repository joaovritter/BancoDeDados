CREATE DATABASE FACULDADE;
USE FACULDADE;
DROP DATABASE FACULDADE;

CREATE TABLE ALUNO (
	Nome VARCHAR (255) NOT NULL,
    Numero_aluno INT PRIMARY KEY,
    Tipo_aluno INT,
    Curso VARCHAR (10)
);

CREATE TABLE DISCIPLINA (
	Nome_disciplina VARCHAR (255) NOT NULL UNIQUE,
    Numero_disciplina VARCHAR (10) PRIMARY KEY,
    Creditos INT, CHECK (Creditos >=1 AND Creditos <=4),
    Departamento VARCHAR (10)
);

CREATE TABLE TURMA (
	Identificacao_turma INT PRIMARY KEY,
	Numero_d VARCHAR (10),
    Semestre VARCHAR (10),
    Ano INT,
    Professor VARCHAR (255),
    FOREIGN KEY (Numero_d) REFERENCES DISCIPLINA (Numero_disciplina)
);

CREATE TABLE HISTORICO_ESCOLAR (
	Numero_a INT,
	Identificacao_t INT,
    NOTA CHAR (1),
	FOREIGN KEY (Numero_a) REFERENCES ALUNO (Numero_aluno),
    FOREIGN KEY (Identificacao_t) REFERENCES TURMA (Identificacao_turma)
);

CREATE TABLE PRE_REQUISITO (
	Numero_d VARCHAR (10),
    Numero_pre_requisito VARCHAR (10),
	FOREIGN KEY (Numero_d) REFERENCES DISCIPLINA (Numero_disciplina),
    FOREIGN KEY ( Numero_pre_requisito) REFERENCES DISCIPLINA (Numero_disciplina)
);

INSERT INTO ALUNO VALUES ('Silva', 17, 1,'CC');
INSERT INTO ALUNO VALUES ('Braga', 8, 2,'CC');
INSERT INTO ALUNO VALUES ('João', 10, 3,'SI');
INSERT INTO ALUNO VALUES ('Marcelo', 12, 4,'SI');
INSERT INTO ALUNO VALUES ('Wendel', 15, 5,'SI');

INSERT INTO DISCIPLINA VALUES ('Introdução à ciência da computação', 'CC1310',4,'CC');
INSERT INTO DISCIPLINA VALUES ('Estrutura de dados', 'CC3320',4,'CC');
INSERT INTO DISCIPLINA VALUES ('Matemática discreta', 'MAT2410',3,'MAT');
INSERT INTO DISCIPLINA VALUES ('Banco de dados', 'CC3380',3,'CC');


INSERT INTO TURMA VALUES (85, 'MAT2410','Segundo',07,'Kleber');
INSERT INTO TURMA VALUES (92, 'CC1310','Segundo',07,'Anderson');
INSERT INTO TURMA VALUES (102, 'CC3320','Primeiro',08,'Carlos');
INSERT INTO TURMA VALUES (112, 'MAT2410','Segundo',08,'Chang');
INSERT INTO TURMA VALUES (119, 'CC1310','Segundo',08,'Anderson');
INSERT INTO TURMA VALUES (135, 'CC3380','Segundo',08,'Santos');


INSERT INTO PRE_REQUISITO VALUES ('CC3380', 'CC3320');
INSERT INTO PRE_REQUISITO VALUES ('CC3380', 'MAT2410');
INSERT INTO PRE_REQUISITO VALUES ('CC3320', 'CC1310');

INSERT INTO HISTORICO_ESCOLAR VALUES (17, 112, 'B');
INSERT INTO HISTORICO_ESCOLAR VALUES (17, 119, 'C');
INSERT INTO HISTORICO_ESCOLAR VALUES (8, 85, 'A');
INSERT INTO HISTORICO_ESCOLAR VALUES (8, 92, 'A');
INSERT INTO HISTORICO_ESCOLAR VALUES (8, 102, 'B');
INSERT INTO HISTORICO_ESCOLAR VALUES (8, 135, 'A');


INSERT INTO ALUNO (Numero_aluno, Nome, Tipo_aluno, Curso) VALUES (17,"Juca",2,"CC");
#Restricao de integridade de chave primaria, o Numero_aluno 17 ja existe. Deve ser unico.

INSERT INTO HISTORICO_ESCOLAR (Numero_a, Identificacao_t, Nota) VALUES (99,112,"A");
#Restricao de integridade referencial, Numero_a 99 não existe na chave primaria Numero_aluno da tabela Aluno.

UPDATE DISCIPLINA SET Creditos =-3 WHERE Numero_disciplina = "CC1310";
#Restricao de integridade de dominio, creditos nao pode ser um valor menor que 1 e maior que 4.

INSERT INTO PRE_REQUISITO (Numero_d, Numero_pre_requisito) VALUES ('CC9999', 'CC3320');
#Restricao de integridade referencial, a disciplina CC9999 nao existe em Numero_disciplina na tabela DISCIPLINA.

DELETE FROM DISCIPLINA WHERE Numero_disciplina = 'CC1310';
#Restricao de integridade referencial, essa disciplina esta sendo usada em outras tabelas, Pre_requisito e Turma

INSERT INTO DISCIPLINA VALUES ('Projeto de Banco de Dados', "G03I8",4,"CC");
#Nenhuma violacao de restricao

SELECT Nome
FROM ALUNO
WHERE Curso = 'CC' ORDER BY CURSO ASC ;

SELECT Nome_disciplina
FROM DISCIPLINA
WHERE Nome_disciplina LIKE 'Introdu%' ORDER BY Numero_disciplina ASC;

SELECT DISTINCT Curso
FROM ALUNO;

SELECT  Nome_disciplina, Creditos, Identificacao_turma, Semestre, Ano, Professor
FROM DISCIPLINA, TURMA
WHERE Nome_disciplina = 'Projeto de Banco de Dados' AND Nome_disciplina ='Banco de dados' AND Nome_disciplina = 'Matemática discreta' AND Nome_disciplina ='Estrutura de dados' AND Nome_disciplina ='Introdução à ciência da computação'
AND Semestre = 'Primeiro' AND Semestre = 'Segundo'
ORDER BY Nome_disciplina, Semestre ASC;

SELECT Nome, Numero_d, Professor, Identificacao_t
FROM ALUNO, TURMA, HISTORICO_ESCOLAR
WHERE Nome, Numero_d, Professor, Identificacao_t ORDER BY Nome, Numero_d, Professor;
