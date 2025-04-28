CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  turma TEXT NOT NULL,
  curso TEXT NOT NULL,
  data_nascimento DATE
);

INSERT INTO alunos (nome, turma, curso, data_nascimento)
VALUES ('Thulio Pinto', '1B', 'Ciência da Computação', '2006-04-14'),
       ('Diego Figueiredo', '1B', 'Ciência da Computação', '2006-03-10'),
       ('Leandro Filho', '1B', 'Engenharia da Computação', '2006-08-16'),
       ('Messias Vereador', '1B', 'Ciência da Computação', '2006-05-18'),
       ('Gabriel Willian', '1B', 'Ciência da Computação', '2005-09-17'),
       ('Eduardo Jesus', '1B', 'Engenharia da Computação', '2006-07-16'),
       ('Antonio Augusto', '1B', 'Ciência da Computação', '2004-11-23'),
       ('Lucas Pomin', '1B', 'Engenharia da Computação', '2005-12-25'),
       ('Rafael Santana', '1B', 'Engenharia da Computação', '2006-04-28'),
       ('Nicole Venino', '1B', 'Engenharia da Computação', '2006-07-12'),
       ('Luana de Jesus', '1B', 'Sistemas de Informação', '2006-06-13');

CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  duracao_anos INT
);

INSERT INTO cursos (nome, duracao_anos)
VALUES ('Engenharia da Computação', 4),
       ('Ciência da Computação', 4),
       ('Sistemas de Informação', 4);

CREATE TABLE matriculas (
  id SERIAL PRIMARY KEY,
  aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
  curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
  data_matricula DATE DEFAULT CURRENT_DATE
);

INSERT INTO matriculas (aluno_id, curso_id)
VALUES (1, 2),
       (2, 2),
       (3, 1),
       (4, 2),
       (5, 2),
       (6, 1),
       (7, 2),
       (8, 1),
       (9, 1),
       (10, 1),
       (11, 3);

DROP TABLE matriculas;

SELECT a.nome AS aluno, c.nome AS curso, m.data_matricula
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id;