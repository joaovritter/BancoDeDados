----8 
ALTER TABLE HISTORICO_ESCOLAR 
WITH CHECK ADD CONSTRAINT fk_identificacao_turma
FOREIGN KEY (identificacao_turma) REFERENCES TURMA (identificacao_turma)
ON UPDATE CASCADE;

UPDATE TURMA
SET Identificacao_turma = 777
WHERE Identificacao_turma = 102;

SELECT * FROM TURMA;

SELECT * FROM HISTORICO_ESCOLAR;