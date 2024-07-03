CREATE DATABASE academia;
USE academia;
CREATE TABLE personal (
    nome VARCHAR(100),
    matricula VARCHAR(50) PRIMARY KEY
);


CREATE TABLE grupo_muscular (
    nome VARCHAR(50) PRIMARY KEY
);


CREATE TABLE exercicio (
    id_exercicio INT PRIMARY KEY,
    nome_grupo VARCHAR(50),
    nome VARCHAR(100),
    FOREIGN KEY (nome_grupo) REFERENCES grupo_muscular (nome)
);


CREATE TABLE condicionamento (
    id_condicionamento INT PRIMARY KEY,
    exercicio VARCHAR(100),
    tempo DECIMAL(5, 2),
    velocidade DECIMAL(5, 2),
    aquecimento BIT
);


CREATE TABLE aluno (
    matricula VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    objetivo VARCHAR(255),
    altura DECIMAL(3, 2),
    data_inicio DATE,
    data_final DATE,
    frequencia_treino INT,
    pausa_entre_series INT,
    peso_inicial DECIMAL(5, 2),
    peso_meta DECIMAL(5, 2),
    matricula_personal VARCHAR(50),
    FOREIGN KEY (matricula_personal) REFERENCES personal(matricula)
);


CREATE TABLE ficha_treino (
    id_ficha INT PRIMARY KEY,
    matricula_aluno VARCHAR(50),
    id_condicionamento INT,
    FOREIGN KEY (matricula_aluno) REFERENCES aluno(matricula),
    FOREIGN KEY (id_condicionamento) REFERENCES condicionamento(id_condicionamento)
);


CREATE TABLE controle_frequencia (
    id_frequencia INT PRIMARY KEY,
    id_ficha INT,
    dia DATE,
    semana INT,
    FOREIGN KEY (id_ficha) REFERENCES ficha_treino(id_ficha)
);


CREATE TABLE treino_exercicio (
    id_treino_exercicio INT PRIMARY KEY,
    id_ficha INT,
    id_exercicio INT,
    serie INT,
    repeticao INT,
    ordem INT,
    FOREIGN KEY (id_ficha) REFERENCES ficha_treino(id_ficha),
    FOREIGN KEY (id_exercicio) REFERENCES exercicio(id_exercicio)
);

-- Inserir registros na tabela Personal
INSERT INTO personal (nome, matricula)
VALUES 
    ('Carlos Santos', 'P001'),
    ('Fernanda Alves', 'P002'),
    ('José Lima', 'P003'),
    ('Ana Paula', 'P004'),
    ('Marcelo Ferreira', 'P005'),
    ('Tatiana Souza', 'P006'),
    ('Roberto Silva', 'P007'),
    ('Luciana Mendes', 'P008'),
    ('Renato Oliveira', 'P009'),
    ('Sabrina Costa', 'P010');

-- Inserir registros na tabela Grupo Muscular
INSERT INTO grupo_muscular (nome)
VALUES 
    ('Peitoral'),
    ('Bíceps'),
    ('Pernas'),
    ('Costas'),
    ('Ombros'),
    ('Tríceps'),
    ('Abdômen'),
    ('Glúteos'),
    ('Panturrilhas'),
    ('Antebraço');

-- Inserir registros na tabela Exercicio
INSERT INTO exercicio (id_exercicio, nome_grupo, nome)
VALUES 
    (1, 'Peitoral', 'Supino Reto'),
    (2, 'Bíceps', 'Rosca Direta'),
    (3, 'Pernas', 'Agachamento'),
    (4, 'Costas', 'Puxada Frontal'),
    (5, 'Ombros', 'Elevação Lateral'),
    (6, 'Tríceps', 'Tríceps Pulley'),
    (7, 'Abdômen', 'Abdominal'),
    (8, 'Glúteos', 'Elevação de Quadril'),
    (9, 'Panturrilhas', 'Panturrilha em Pé'),
    (10, 'Antebraço', 'Rosca Inversa');

-- Inserir registros na tabela Condicionamento
INSERT INTO condicionamento (id_condicionamento, exercicio, tempo, velocidade, aquecimento)
VALUES 
    (1, 'Bicicleta', 30, 10, 1),
    (2, 'Esteira', 60, 5, 1);
    
-- Inserir registros na tabela Aluno
INSERT INTO aluno (matricula, nome, data_nascimento, objetivo, altura, data_inicio, data_final, frequencia_treino, pausa_entre_series, peso_inicial, peso_meta, matricula_personal)
VALUES 
    ('A001', 'André Silva', '1994-01-01', 'Perder peso', 1.75, '2024-01-01', '2024-12-31', 3, 60, 80.5, 75.0, 'P001'),
    ('A002', 'Bruna Oliveira', '1999-02-02', 'Definir musculatura', 1.65, '2024-02-01', '2024-08-31', 4, 90, 60.0, 58.0, 'P002'),
    ('A003', 'Caio Pereira', '1996-03-03', 'Ganhar massa muscular', 1.80, '2024-03-01', '2024-09-30', 3, 120, 90.0, 85.0, 'P003'),
    ('A004', 'Daniela Costa', '1992-04-04', 'Melhorar condicionamento', 1.70, '2024-04-01', '2024-10-31', 2, 45, 70.0, 65.0, 'P004'),
    ('A005', 'Eduardo Gomes', '1988-05-05', 'Aumentar resistência', 1.82, '2024-05-01', '2024-11-30', 3, 50, 85.0, 80.0, 'P005'),
    ('A006', 'Fabiana Rocha', '1995-06-06', 'Reduzir percentual de gordura', 1.68, '2024-06-01', '2024-12-31', 4, 70, 68.0, 63.0, 'P006'),
    ('A007', 'Gustavo Andrade', '2000-07-07', 'Melhorar postura', 1.75, '2024-07-01', '2025-01-31', 3, 40, 72.0, 68.0, 'P007'),
    ('A008', 'Helena Lima', '1993-08-08', 'Ganhar massa muscular', 1.60, '2024-08-01', '2024-11-30', 2, 30, 58.0, 55.0, 'P008'),
    ('A009', 'Igor Sousa', '1997-09-09', 'Ganhar massa muscular', 1.78, '2024-09-01', '2025-03-31', 4, 80, 75.0, 72.0, 'P009'),
    ('A010', 'Julia Martins', '2001-10-10', 'Preparação para competição', 1.70, '2024-10-01', '2025-04-30', 5, 100, 62.0, 58.0, 'P010');

-- Inserir registros na tabela Ficha de Treino
INSERT INTO ficha_treino (id_ficha, matricula_aluno, id_condicionamento)
VALUES 
    (1, 'A001', 1),
    (2, 'A002', 2),
    (3, 'A003', 1),
    (4, 'A004', 2),
    (5, 'A005', 2),
    (6, 'A006', 2),
    (7, 'A007', 1),
    (8, 'A008', 2),
    (9, 'A009', 1),
    (10, 'A010', 2);

-- Inserir registros na tabela Controle de Frequencia
INSERT INTO controle_frequencia (id_frequencia, id_ficha, dia, semana)
VALUES 
    (1, 1, '2024-01-01', 1),
    (2, 1, '2024-01-08', 2),
    (3, 1, '2024-01-15', 3),
    (4, 1, '2024-01-22', 4),
    (5, 2, '2024-02-01', 1),
    (6, 2, '2024-02-08', 2),
    (7, 2, '2024-02-15', 3),
    (8, 2, '2024-02-22', 4),
    (9, 3, '2024-03-01', 1),
    (10, 3, '2024-03-08', 2);

-- Inserir registros na tabela TreinoExercicio
INSERT INTO treino_exercicio (id_treino_exercicio, id_ficha, id_exercicio, serie, repeticao, ordem)
VALUES 
    (1, 1, 1, 3, 12, 1),
    (2, 1, 2, 4, 10, 2),
    (3, 2, 3, 3, 15, 1),
    (4, 2, 4, 4, 8, 2),
    (5, 3, 5, 3, 12, 1),
    (6, 3, 6, 4, 10, 2),
    (7, 4, 7, 3, 15, 1),
    (8, 4, 8, 4, 8, 2),
    (9, 5, 9, 3, 12, 1),
    (10, 5, 10, 4, 10, 2);

-- 7 
SELECT *
FROM aluno
ORDER BY nome;

-- 8 
SELECT A.nome, CF.id_ficha, CF.dia, CF.semana, CF.id_ficha
FROM controle_frequencia as CF
JOIN ficha_treino as F ON CF.id_ficha = F.id_ficha
JOIN aluno as A ON F.matricula_aluno = A.matricula
WHERE F.matricula_aluno = 'A001'
ORDER BY CF.dia ASC;

-- 9 
SELECT c.id_condicionamento, c.exercicio, c.tempo, c.velocidade, c.aquecimento, a.nome, a.data_inicio
FROM condicionamento c
JOIN ficha_treino f ON c.id_condicionamento = f.id_condicionamento
JOIN aluno a ON f.matricula_aluno = a.matricula
ORDER BY a.data_inicio ASC;

SELECT a.nome AS aluno_nome, a.objetivo, COUNT(te.id_exercicio) AS total_exercicios, p.nome AS personal_nome
FROM aluno a
JOIN ficha_treino ft ON a.matricula = ft.matricula_aluno
LEFT JOIN treino_exercicio te ON ft.id_ficha = te.id_ficha
JOIN personal p ON a.matricula_personal = p.matricula
GROUP BY a.nome, a.objetivo, p.nome
ORDER BY a.nome ASC;

