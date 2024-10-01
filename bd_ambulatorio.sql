CREATE DATABASE bd_ambulatorio

USE bd_ambulatorio

CREATE TABLE tb_pacientes(
	nome	varchar(150)	NOT NULL,
	sexo	varchar(10)		NOT NULL,
	idade	int				NOT NULL,
	doenca_inicial	varchar(100)	NOT NULL,
	id_paciente	int			NOT NULL,
	primary key (id_paciente)
);

DROP TABLE tb_pacientes

CREATE TABLE tb_doencas(
	descricao	varchar(100)	NOT NULL,
	id_doenca	int				NOT NULL,
	primary key (id_doenca)
);

DROP TABLE tb_doencas

CREATE TABLE tb_ambulatorio(
	numero	varchar(100)	NOT NULL,
	andar	varchar(50)		NOT NULL,
	capacidade	int			NOT NULL,
	id_ambulatorio	int		NOT NULL,
	primary key (id_ambulatorio)
);

DROP TABLE tb_ambulatorio

CREATE TABLE tb_especialidade(
	descricao	varchar(100)	NOT NULL,
	id_especialidade	int	NOT NULL,
	primary key (id_especialidade)
);

DROP TABLE tb_especialidade

CREATE TABLE tb_medicos(
	nome	varchar(100)	NOT NULL,
	crm		varchar(100)	NOT NULL,
	salario	varchar(100)	NOT NULL,
	idade	int				NOT NULL,
	id_ambulatorio	int,
	id_especialidade	int,
	id_medico	int			NOT NULL,
	FOREIGN KEY (id_ambulatorio) REFERENCES tb_ambulatorio(id_ambulatorio),
	FOREIGN KEY (id_especialidade) REFERENCES tb_especialidade(id_especialidade),
	primary key (id_medico)
);

DROP TABLE tb_medicos

CREATE TABLE tb_funcionarios(
	nome	varchar(150)	NOT NULL,
	idade	int				NOT NULL,
	sexo	varchar(1)		NOT NULL,
	salario	int				NOT NULL,
	cidade	varchar(50)		NOT NULL,
	id_ambulatorio	int,
	id_funcionario	int		NOT NULL,
	FOREIGN KEY (id_ambulatorio)	REFERENCES tb_ambulatorio(id_ambulatorio),
	primary key (id_funcionario)
);

DROP TABLE tb_funcionarios

CREATE TABLE tb_consultas(
	data	varchar(50)		NOT NULL,
	hora	varchar(50)		NOT NULL,
	id_medico	int,
	id_paciente	int,
	id_ambulatorio	int,
	id_doenca	int,
	id_consultas	int		NOT NULL,
	FOREIGN KEY (id_medico)	REFERENCES	tb_medicos(id_medico),
	FOREIGN KEY (id_paciente)	REFERENCES	tb_pacientes(id_paciente),
	FOREIGN KEY	(id_ambulatorio)	REFERENCES	tb_ambulatorio(id_ambulatorio),
	FOREIGN KEY (id_doenca)	REFERENCES	tb_doencas(id_doenca),
	primary key (id_consultas)
);

DROP TABLE	tb_consultas

INSERT INTO tb_pacientes (nome, sexo, idade, doenca_inicial, id_paciente) VALUES
	('Domênica Santos', 'F', 20, 'Gripe', 102),
	('Camila da Silva', 'M', 19, 'Covid 19', 103),
	('Bruna Ferreira', 'F', 25, 'Sarampo', 104),
	('Eduardo Gomes', 'M', 32, 'Dengue', 105)

INSERT	INTO tb_doencas (descricao, id_doenca) VALUES
	('Acne', 1),
	('Alcoolismo Agudo', 2),
	('Asma', 3)

INSERT	INTO	tb_ambulatorio (numero, andar, capacidade, id_ambulatorio) VALUES
	('2000', '12°', 400, 1),
	('1500A', '8°', 300, 2),
	('550', '1°', 200, 3)

INSERT INTO tb_especialidade (descricao, id_especialidade) VALUES
	('Pediatra', 10),
	('Clinio Geral', 20),
	('Clinico', 30)

INSERT INTO tb_medicos (nome, crm, salario, idade, id_ambulatorio, id_especialidade, id_medico) VALUES
	('Dr. Carlos Jobim',	'52-71557-3',	'12000',		50, 1, 1,	201),
	('Dr. André Firmino',	'50-12345-6',	'22000,57',		63, 1, 10,	202),
	('Dra. Ana Maria',		'10-20201-5',	'40.000,61',	42, 2, 10,	203),
	('Dr. João Carlos',		'22-20192-7',	'38.001',		56, 3, 2,	204)

INSERT INTO tb_funcionarios (nome, idade, sexo, salario, cidade, id_ambulatorio, id_funcionario) VALUES
	('Fernanda Fernandes', 34, 'F', 2000, 'São Paulo', 1, 1),
	('Bruna Souza', 25, 'F' ,1700, 'Guarulho', 1, 2),
	('Jessica Filho', 20, 'F', 3000, 'Sorocaba', 1, 3),
	('Leandro Leonardo', 27, 'M', 2500, 'São Paulo', 3, 4)

INSERT INTO tb_consultas (data, hora, id_medico, id_paciente, id_ambulatorio, id_doenca, id_consultas) VALUES
	('01/02/2020', '12h00', 201, 101, 1, 1, 1),
	('25/03/2018', '11:30', 202, 102, 1, 1, 2),
	('30/04/2019', '16:25', 203, 103, 3, 2, 3),
	('05/05/2025', '17:05', 201, 104, 2, 3, 4)