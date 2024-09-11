-- Meu primeiro procedure
CREATE PROCEDURE ExibirNome 
AS
BEGIN 
	SELECT 'JOAO BALA' AS 'Nome';
	PRINT 'JOAO BALA';
END

EXEC ExibirNome ;
