#deletar database show de bola
DROP DATABASE EMPRESA;

#criando minha database top de bala
CREATE DATABASE IF NOT EXISTS EMPRESA;

#criando as tabelonas tops show de bola  
CREATE TABLE EMPRESA.FUNCIONARIO (
	Pnome VARCHAR (15) NOT NULL,
    Minicial CHAR,
    Unome VARCHAR(15) NOT NULL,
    Cpf CHAR (11) PRIMARY KEY,
    Datanasc DATE NOT NULL,
    Endereco VARCHAR (255) NOT NULL,
    Sexo CHAR NOT NULL,
    Dnr INT,
    Salario DECIMAL(10,2) NOT NULL CHECK (Salario > 0),
    Cpf_supervisor CHAR(11),
    
    FOREIGN KEY (Cpf_supervisor) REFERENCES FUNCIONARIO(Cpf)

);
#verificar informacoes da tabela criada
DESC EMPRESA.FUNCIONARIO;

#criando departamento
CREATE TABLE EMPRESA.DEPARTAMENTO (
Dnome VARCHAR (15) NOT NULL,
Dnumero INT,
Cpf_gerente CHAR (11),
Data_inicio_gerente DATE,
PRIMARY KEY (Dnumero),
UNIQUE (Dnome),
FOREIGN KEY (Cpf_gerente) REFERENCES FUNCIONARIO(Cpf)

);

#Adicionando restricao referencial em FUNCIONARIO de DEPARTAMENTO 
#Criando Alteracao

ALTER TABLE EMPRESA.FUNCIONARIO
ADD FOREIGN KEY (Dnr) REFERENCES DEPARTAMENTO (Dnumero);

CREATE TABLE EMPRESA.LOCALIZACAO_DEP (
	Dnumero INT NOT NULL,
    Dlocal VARCHAR (15) NOT NULL,
    PRIMARY KEY (Dnumero, Dlocal),
    FOREIGN KEY (Dnumero) REFERENCES DEPARTAMENTO(Dnumero)
);
CREATE TABLE EMPRESA.PROJETO (
	Projnome VARCHAR (15) NOT NULL UNIQUE,
    Projnumero INT PRIMARY KEY,
    projlocal VARCHAR (15) ,
    Dnum INT,
    FOREIGN KEY (Dnum) REFERENCES DEPARTAMENTO (Dnumero)
);

CREATE TABLE EMPRESA.TRABALHA_EM (
	Fcpf CHAR (11) NOT NULL,
    Pnr INT NOT NULL,
    Horas DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (Fcpf,Pnr),
    FOREIGN KEY (Fcpf) REFERENCES FUNCIONARIO (Cpf),
    FOREIGN KEY (Pnr) REFERENCES PROJETO (Projnumero)
    
);

#selecionar a database para execução de comandos 

USE EMPRESA;

CREATE TABLE DEPENDENTE (
	Fcpf CHAR (11) NOT NULL,
	Nome_dependente VARCHAR (15),
	Sexo CHAR,
	Datanasc DATE,
	Parentesco VARCHAR (8),
	PRIMARY KEY (Fcpf, Nome_dependente),
	FOREIGN KEY (Fcpf) REFERENCES FUNCIONARIO (Cpf)

);

#inserindo valores em Departamento

INSERT INTO DEPARTAMENTO (Dnome, Dnumero) VALUES ('Pesquisa', 5);
INSERT INTO DEPARTAMENTO (Dnome, Dnumero) VALUES ('Administracao', 4);
INSERT INTO DEPARTAMENTO (Dnome, Dnumero) VALUES ('Matriz', 1);
#Recuperando todos os registros de DEPARTAMENTO
SELECT * FROM DEPARTAMENTO;

DESC FUNCIONARIO;
INSERT INTO FUNCIONARIO (Pnome,Minicial,Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Dnr) 
VALUES ('Joao','V','Ritter', 02155849028,'2004-07-17', 'Rua pqp', 'M', 12500, 5);