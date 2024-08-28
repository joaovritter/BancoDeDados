--SELECT para colocar valor em uma variavel
--Declarando as variaveis

DECLARE @Nome_Funcionario VARCHAR (100),
		@Salario DECIMAL(10,2),
		@Aumento DECIMAL(10,2),
		@Novo_salario DECIMAL (10,2);

SELECT @Nome_Funcionario = F.Pnome, @Salario = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'Jennifer';

SELECT @Nome_Funcionario, @Salario AS 'Salario';


--AUMENTO DE SALARIO PARA JENNIFER EM 10%
SET @Aumento =0.1;
SET	@Novo_salario = @Salario + (@Salario*@Aumento);

PRINT 'Funcionario(a) '+ @Nome_Funcionario 
	  +' Salario de R$'
	  +CAST(@Salario AS VARCHAR (15)) 
	  +' novo salario (+10%) R$' 
	  +CAST (@Novo_Salario AS VARCHAR (15));

UPDATE FUNCIONARIO
SET Salario = @Novo_salario
WHERE Pnome = 'Jennifer';

SELECT * FROM FUNCIONARIO WHERE Pnome = 'Jennifer';


-- RECUPERE O NOME DO DEPARTAMENTO COM Dnumero = 2
DECLARE @Nome_departamento VARCHAR (100)

SELECT @Nome_departamento = D.Dnome
FROM DEPARTAMENTO AS D;
WHERE D.Dnumero = 5;

--SELECT PARA EXIBIR
SELECT @Nome_departamento AS 'NOME DEPARTAMENTO';



--DECLARANDO TABELA PROVISORIA
DECLARE @ALUNO TABLE(
	Id INT IDENTITY PRIMARY KEY,
	Nome VARCHAR (50),
	Data_Nasc DATE,
	Curso CHAR(2)
);

--Inserir valores nesta tabela
INSERT INTO @ALUNO
VALUES ('Juca da Silva', '1990-12-25','SI');

--Recuperar informacoes desta tabela
SELECT * FROM @ALUNO;

-- Mostrar idade
DECLARE @idade INT;
SELECT @idade = (YEAR(GETDATE()) - YEAR(Data_Nasc))
FROM @ALUNO
WHERE Id = 1;

PRINT 'Idade: ' +CAST(@idade AS VARCHAR (3))


------CAST
DECLARE @Nome_Funcionario VARCHAR (100),
		@Salario DECIMAL (10,2);

SELECT @Nome_Funcionario = F.Pnome, @Salario =F.salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'Jennifer';

PRINT 'Funcionario(a) '+ @Nome_Funcionario 
	  +' tem um Salario de R$'
	  +CAST(@Salario AS VARCHAR (15));


------CONVERT
SELECT 'O funcionario(a) '+F.Pnome+'tem salario de R$'+ CONVERT(VARCHAR(15), F.salario)
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'Jennifer';

--Converter data nascimento para dd/mm/aaaa
SELECT 'O funcionario(a) '+F.Pnome+ 'Data de nascimento ' + CONVERT(VARCHAR(15),F.Datanasc,103)
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'Jennifer';



------ IF / ELSE
DECLARE @idade INT,
		@nome VARCHAR (15);
SET @idade = 19;
SET @nome = 'Juca';

IF (@idade>=18)
	PRINT 'O USUARIO '+@nome + ' PODE ACESSAR O SITE';
ELSE 
	PRINT 'O USUARIO' + @nome + 'NAO TEM IDADE PERMITIDA'

--Verificar se um Funcionário Recebe Abaixo da Média Salarial
DECLARE @media_salario DECIMAL (10,2),
		@salario_funcionario DECIMAL(10,2),
		@Nome_Funcionario VARCHAR (15);
SET @Nome_Funcionario = 'Jennifer';

SELECT @media_salario = AVG(Salario)
FROM FUNCIONARIO;

SELECT @salario_funcionario = @salario_funcionario
FROM FUNCIONARIO
WHERE Pnome = @Nome_Funcionario;

PRINT 'SALARIO MEDIO: '
	+ CONVERT(VARCHAR(10),@media_salario)
	+'SALARIOD DA '
	+ @Nome_Funcionario
	+ ':'
	+CONVERT(VARCHAR(10),@salario_funcionario);

IF (@media_salario > @salario_funcionario)
	PRINT 'Salario abaixo da media'
ELSE
	PRINT 'Salario acima da media'


--IF NOT EXISTS

IF NOT EXISTS(SELECT* FROM sys.objects WHERE object_id = OBJECT_ID('FACULDADE'))
	BEGIN 
		CREATE TABLE FACULDADE(
		Id INT IDENTITY PRIMARY KEY,
		Nome VARCHAR (100),
		Nota1 FLOAT,
		Nota2 FLOAT,
		Nota3 FLOAT
		);
	END
ELSE 
	PRINT 'JA EXISTE ESSA TABELA'

--Verificar se um Funcionário Está Próximo da Aposentadoria, considerar a idade para aposentadoria de 60 anos.
DECLARE @idade_funcionario DECIMAL (4);

SELECT @idade_funcionario = CAST((YEAR(GETDATE())-YEAR(Datanasc)) AS VARCHAR(4))
FROM FUNCIONARIO
WHERE Pnome = 'Jennifer';

PRINT @idade_funcionario;

IF (@idade_funcionario > 60)
	PRINT 'JA APOSENTA'
ELSE 
	PRINT 'BORA TRABALHAR'