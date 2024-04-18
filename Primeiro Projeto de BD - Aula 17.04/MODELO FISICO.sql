CREATE DATABASE EMPRESA;

CREATE TABLE EMPRESA.FUNCIONARIO (
Cpf char (11) primary key,
Pnome VARCHAR (20) NOT NULL,
Minicial CHAR NOT NULL,
Unome VARCHAR(20) NOT NULL,
DataNascimento DATE NOT NULL,
Endereco varchar (50) not null,
sexo char not null,
Salario float not null, 
FUNCIONARIO_Cpf char (11)

);

ALTER TABLE EMPRESA.FUNCIONARIO
ADD Dnumero int,
ADD Dnumero2 int,
ADD FOREIGN KEY (Dnumero) REFERENCES DEPARTAMENTO (Dnumero),
ADD FOREIGN KEY (Dnumero2) REFERENCES DEPARTAMENTO (Dnumero);

CREATE TABLE EMPRESA.DEPARTAMENTO (
Dnumero int primary key,
Dnome varchar (50) not null
);

CREATE TABLE EMPRESA.DEPENDENTE (
Nome varchar (50) primary key,
Sexo char (1) not null,
Parentesco varchar(20) not null,
DataNascimento date not null,
FUNCIONARIO_Cpf char (11)
);


ALTER TABLE EMPRESA.DEPARTAMENTO
ADD DataInicioGerente date;

CREATE TABLE EMPRESA.LOCALIZACAO_DEP (
Dlocal varchar (50) primary key,
D_Dnumero int,
FOREIGN KEY (D_Dnumero) REFERENCES DEPARTAMENTO (Dnumero)
);

CREATE TABLE EMPRESA.PROJETO (
Pnumero int primary key,
Pnome varchar (50) not null,
Plocal varchar (45) not null,
D_Dnumero int,
FOREIGN KEY (D_Dnumero) REFERENCES DEPARTAMENTO (Dnumero)
);

CREATE TABLE EMPRESA.TRABALHA_EM (
Horas decimal primary key,
FUNCIONARIO_CPF char (11),
PROJETO_Pnumero int,
FOREIGN KEY (FUNCIONARIO_CPF) REFERENCES FUNCIONARIO (Cpf),
FOREIGN KEY (PROJETO_Pnumero) REFERENCES PROJETO (Pnumero)

);

ALTER TABLE EMPRESA.TRABALHA_EM
MODIFY Horas decimal;
