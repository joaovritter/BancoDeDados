CREATE PROCEDURE Adiocinar_Autor (@nome VARCHAR (50), @nacionalidade VARCHAR(50))
AS 
BEGIN
	INSERT INTO Autor (nome, nacionalidade)
	VALUES (@nome, @nacionalidade);


END

EXEC Adiocinar_Autor 'Jo�o Picasso', 'Ga�cho';
SELECT * FROM Autor;
