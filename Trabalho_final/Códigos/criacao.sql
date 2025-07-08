USE escola;

CREATE TABLE Cidade (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Pessoa (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone CHAR(11),
    cod_cidade INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Escola (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100),
    cod_cidade INT NOT NULL,
    cod_prof INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Turma (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cod_escola INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Turma_Ministra (
    cod_turma INT NOT NULL,
    cod_disciplina INT NOT NULL,
    cod_prof INT NOT NULL,
    PRIMARY KEY (cod_turma, cod_disciplina, cod_prof)
);

CREATE TABLE Disciplina (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE Ministra (
    cod_disciplina INT NOT NULL,
    cod_prof INT NOT NULL,
    PRIMARY KEY (cod_disciplina, cod_prof)
);

CREATE TABLE Professor (
    id INT,
    rg VARCHAR(10) UNIQUE NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    titulacao VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE Aluno (
    id INT,
    matricula VARCHAR(30) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    cod_turma INT,
    PRIMARY KEY (id)
);

CREATE TABLE Contato (
    nome VARCHAR(100) NOT NULL,
    telefone CHAR(11),
    cod_aluno INT NOT NULL,
    PRIMARY KEY (nome, cod_aluno)
);

ALTER TABLE Pessoa
ADD CONSTRAINT fk_pessoa_cidade
FOREIGN KEY (cod_cidade) REFERENCES Cidade(id);

ALTER TABLE Escola
ADD CONSTRAINT fk_escola_cidade
FOREIGN KEY (cod_cidade) REFERENCES Cidade(id);

ALTER TABLE Escola
ADD CONSTRAINT fk_escola_prof_diretor
FOREIGN KEY (cod_prof) REFERENCES Professor(id);

ALTER TABLE Turma
ADD CONSTRAINT fk_turma_escola
FOREIGN KEY (cod_escola) REFERENCES Escola(id);

ALTER TABLE Turma_Ministra
ADD CONSTRAINT fk_turma_ministra_turma
FOREIGN KEY (cod_turma) REFERENCES Turma(id);

ALTER TABLE Turma_Ministra
ADD CONSTRAINT fk_turma_ministra_disciplina_prof
FOREIGN KEY (cod_disciplina, cod_prof) REFERENCES Ministra(cod_disciplina, cod_prof);

ALTER TABLE Ministra
ADD CONSTRAINT fk_ministra_disciplina
FOREIGN KEY (cod_disciplina) REFERENCES Disciplina(id);

ALTER TABLE Ministra
ADD CONSTRAINT fk_ministra_prof
FOREIGN KEY (cod_prof) REFERENCES Professor(id);

ALTER TABLE Professor
ADD CONSTRAINT fk_professor_pessoa
FOREIGN KEY (id) REFERENCES Pessoa(id)
ON DELETE CASCADE;

ALTER TABLE Aluno
ADD CONSTRAINT fk_aluno_pessoa
FOREIGN KEY (id) REFERENCES Pessoa(id)
ON DELETE CASCADE;

ALTER TABLE Aluno
ADD CONSTRAINT fk_aluno_turma
FOREIGN KEY (cod_turma) REFERENCES Turma(id);

ALTER TABLE Contato
ADD CONSTRAINT fk_contato_aluno
FOREIGN KEY (cod_aluno) REFERENCES Aluno(id);