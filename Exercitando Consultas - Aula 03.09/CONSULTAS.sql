--1)

DECLARE @nome VARCHAR (50) = "Notebook",
	      @quantidade INT (5) = 15,
        	      @preco DECIMAL (10,2) = 2999.99;
        
 SELECT * 
 FROM FUNCIONARIO;
 PRINT ("nome do produto: " +@nome + "  Quantidade: "+@quantidade + "  Valor: R$"+@preco);
 
 
DECLARE @Nome_Funcionario VARCHAR (100),
		@SalarioBase DECIMAL(10,2),
		@Bonus DECIMAL(10,2),
		@SalarioTotal DECIMAL (10,2);

SELECT @Nome_Funcionario = F.Pnome, @SalarioBase = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'Jennifer';

SELECT @Nome_Funcionario, @SalarioBase AS 'Salario';

SET @Bonus =800;
SET @SalarioBase = 50000;
SET	@SalarioTotal = @SalarioBase + @Bonus;

PRINT 'Funcionario(a) '+ @Nome_Funcionario 
	  +' Salario de R$'
	  +CAST(@SalarioBase AS VARCHAR (15)) 
	  +' novo salario R$' 
	  +CAST (@SalarioTotal AS VARCHAR (15));
   
   
--2)
PRINT 'DATA ATUAL:' + CAST(GETDATE() AS VARCHAR (10));
PRINT 'CONVERTENDO: ' + CAST(CONVERT(INT, 12345.67) AS VARCHAR(10));
       
DECLARE @n1 DECIMAL (10,2) = 10,
       	@n2 INT = 5;
PRINT 'CONVERTENDO:' + CONVERT(INT, @n1);
PRINT 'CONVERTENDO: ' +  CAST(CONVERT(DECIMAL (10,2), @n2)AS VARCHAR (10));   
       
--3)
DECLARE @Idade INT = 18;
IF (@Idade <18)
       PRINT 'VOCE É MENOR DE IDADE';
ELSE 
       PRINT 'VOCE É DE MAIOR';

DECLARE @NotaFinal INT = 70;
       
IF (@NotaFinal >=90)
       PRINT 'APROVADO COM EXCELENCIA';
ELSE IF (@NotaFinal>=70)
       PRINT 'APROVADO';
ELSE IF (@NotaFinal>=50 AND @NotaFinal >70)
       PRINT 'RECUPERACAO';
ELSE IF (@NotaFinal <50)	
       PRINT 'REPROVADO';
 
       
DECLARE @Ano INT = 1900;

IF (@Ano % 4 = 0 AND (@Ano % 100!=0 OR @Ano % 400 =0))
       PRINT 'ANO BISSEXTO';
ELSE 
       PRINT 'ANO COMUM';
       

-- 4)
DECLARE @Cont INT = 0;
WHILE (@Cont<10)
BEGIN
	   SET @Cont = @Cont+1;
       PRINT @Cont;
END
       
DECLARE @Valor INT = 100;
WHILE (@Valor>50)
BEGIN
       SET @Valor = @Valor -5;
       PRINT @Valor;
END

DECLARE @Indice INT = 0,
       	@PrecoLimite DECIMAL (10,2)= 100;

SELECT *
FROM PRODUTOS;
       
WHILE (@Indice>@PrecoLimite)
BEGIN
	SET @Indice = @Indice + 1;
    SELECT Nome = @NomeProduto , Preco = @PrecoProduto 
    FROM Produtos;
	
    IF (Preco > @PrecoLimite)
       PRINT 'Nome Do Produto';
END

DECLARE @Numero INT = 2;
WHILE (@Numero <= 1000)
BEGIN 
	SET @Numero = 2*@Numero;
	PRINT @Numero;
END

-- 5) DESAFIO

DECLARE @PrecoOriginal DECIMAL (10,2) = 1999.90,
		@Qtd INT = 11,
		@PrecoFinal DECIMAL (10,2),
		@Desconto DECIMAL (10,2) = 0,
		@i INT = 2; --Começa a contar a partir de 2, pois o desconto é para unidades acima de 1
IF (@Qtd > 10)
	SET @Desconto = 0.1;

ELSE IF (@Qtd < 5)
	WHILE (@i < @Qtd)
	BEGIN 
		SET @Desconto = @Desconto + 0.01;
		SET @i = @i + 1;
	END
		
SET @PrecoFinal = @PrecoOriginal * @Qtd * (1 - @Desconto);

PRINT 'Preço Final: ' + CAST(@PrecoFinal AS VARCHAR(10));