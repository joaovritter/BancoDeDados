-- DECLARE 
DECLARE @Nome VARCHAR (50) = 'João Vitor Ritter',
		@Data_Nasc DATE,
		@Curso VARCHAR(2),
		@Idade INT;

--SET
SET @Data_Nasc = '2004-07-17';
SET @Curso = 'SI';

--IF 
IF (MONTH(GETDATE()) > (MONTH(@Data_Nasc)))
	SET @Idade = YEAR (GETDATE())-YEAR(@Data_Nasc);

ELSE IF (MONTH(GETDATE()) = (MONTH(@Data_Nasc))) AND (DAY(GETDATE()) >= (DAY(@Data_Nasc)))
	SET @Idade = YEAR(GETDATE())-YEAR(@Data_Nasc);
	
ELSE
	SET @Idade = YEAR(GETDATE())-YEAR(@Data_Nasc)-1;


--PRINT 
PRINT 'SEU NOME É ' + @Nome 
	  + ', NASCIDO EM ' 
	  + CONVERT (VARCHAR(15), @Data_Nasc, 103)
	  + ', SUA IDADE É ' + CAST (@Idade AS VARCHAR (3));
	  


--Verificar se um Funcionário Está Próximo da Aposentadoria, considerar a idade para aposentadoria de 60 anos.
DECLARE @Idade_Funcionario INT,
		@Nome_Funcionario VARCHAR (50) = 'Jennifer';

SELECT @Idade_Funcionario = DATEDIFF(YEAR,F.Datanasc, GETDATE())
FROM FUNCIONARIO AS F
WHERE F.PNome = @Nome_Funcionario;

PRINT @idade_funcionario;

IF (@idade_funcionario >= 55) AND (@Idade_Funcionario <60)
	PRINT 'TA QUASE NA HORA';
ELSE IF (@Idade_Funcionario >=60)
	PRINT 'TEM Q SE APOSENTAR JA';
ELSE 
	PRINT 'BORA TRABALHAR';



--Verificar se um Funcioario ja recebeu bonus este ano
DECLARE @Nome_Func VARCHAR(50) = 'André', --TESTE COM MARIA (RECEBEU) E ANDRE (NAO RECEBEU)
		@Bonus DECIMAL(10,2);

SELECT @Bonus = F.Bonus
FROM FUNCIONARIO AS F
WHERE F.PNome = @Nome_Func;

IF (@Bonus>0)
	PRINT @Nome_Func + ' RECEBEU DE BONUS: R$' + CAST(@Bonus AS VARCHAR (15));
ELSE 
	PRINT  @Nome_Func + ' NAO RECEBEU BONUS' ;

select *
from FUNCIONARIO;

--Verificar se o Funcionário é um Novo Contratado (ultimos 6 meses)
DECLARE @Cpf VARCHAR(50) = '98765432400',
		@Admissao DATE,
		@Dias INT;
SET @Dias= DATEDIFF(DAY, @Admissao, GETDATE()) 
SELECT @Admissao = F.Data_Admissao
FROM FUNCIONARIO AS F
WHERE F.Cpf = @Cpf;

IF (@Dias < 180)
	PRINT @Cpf + 'é novo contratado, foi contratado a ' + CAST(@Dias AS VARCHAR(5)) +' dias';

ELSE
 PRINT @Cpf + ' é velho(a) na empresa, foi contratado a ' + CAST(@Dias AS VARCHAR(5)) +' dias';


-- CASE ------------------------------------------- 
-- Classificação de salario S S<=10000 salario baixo, S>10000 AND S<=30000 'Médio'

SELECT CONCAT (F.Pnome, ' ',F.Minicial, ' ', F.Unome) AS 'Nome', 
	   Salario AS 'Receita',
	   CASE
			WHEN Salario <=10000 THEN 'Salario baixo'
			WHEN Salario >10000 AND Salario<=30000 THEN 'Salario medio'
			ELSE 'Alto'
	   END AS 'Categoria'
FROM FUNCIONARIO AS F;


--COM CASE, Verificar se o Funcionário é um Novo Contratado (ultimos 6 meses)
SELECT CONCAT (F.Pnome, ' ',F.Minicial, ' ', F.Unome) AS 'Nome', 
	   F.Data_Admissao AS 'Data Admissao',
	   CASE
			WHEN DATEDIFF(MONTH, F.Data_Admissao, GETDATE()) <= 12 THEN 'Recente'	
			ELSE 'Antigo'
	   END AS 'Contratacao'
FROM FUNCIONARIO AS F;


--Exibir a idade correta de todos os funcionarios
SELECT CONCAT (F.Pnome, ' ',F.Minicial, ' ', F.Unome) AS 'Nome', 
	   F.Datanasc AS 'Data Nascimento',
	   CASE
			WHEN MONTH(GETDATE()) > MONTH (F.Datanasc)
			OR (MONTH (GETDATE()) = MONTH(F.Datanasc) AND DAY (GETDATE())>=DAY(F.Datanasc))
				THEN DATEDIFF(YEAR,F.Datanasc, GETDATE())
			ELSE DATEDIFF(YEAR, F.Datanasc, GETDATE())-1
	   END AS 'Idade'
FROM FUNCIONARIO AS F
ORDER BY Idade;



--WHILE-------------------------------------------
DECLARE @Contador INT =0;

WHILE (@Contador<10)
BEGIN
--	IF @Contador = 5
--		BREAK
	SET @Contador = @Contador+1;

	IF @Contador % 2 = 0 -- se for par, entra no if e continua, nao entrando no print.
		CONTINUE
--	IF @Contador % 2 <> 0 -- com impares
--		CONTINUE
	PRINT 'Contador: '+ CAST(@Contador AS VARCHAR (2));
END


