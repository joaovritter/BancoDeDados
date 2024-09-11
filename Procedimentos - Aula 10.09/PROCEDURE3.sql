CREATE PROCEDURE sp_Funcionario
WITH ENCRYPTION
AS
SELECT *
FROM FUNCIONARIO

EXEC sp_helptext sp_Funcionario;