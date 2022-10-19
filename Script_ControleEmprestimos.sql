/*
 Script criado para a criação do banco de dados de controle de empréstimos pessoais - ControleEmprestimosPessoais
 Data Criação: 28/09/2022
 Disciplina: Arquitetura e Desempenho de BD   ano: 2022 
*/

DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS autoresprincipais;
DROP TABLE IF EXISTS livros;
DROP TABLE IF EXISTS amigos;
DROP TABLE IF EXISTS emprestimos;

--Criando a tabela categorias
CREATE TABLE categorias (
    codigo smallint PRIMARY KEY,
    descricao varchar(100) not null
);

--Criando a tabela autoresprincipais
CREATE TABLE autoresprincipais (
    codigo smallint,
    nome varchar(100) not null,
    PRIMARY KEY (codigo)
);

--Criando a tabela livros
CREATE TABLE livros (
    codigo int PRIMARY KEY,
    titulo varchar(100) not null,
    preco numeric not null,
    volume integer,
    edicao integer,
    qtd_paginas integer,
    situacao varchar(20) not null,
    cod_categoria smallint,
    cod_autor smallint not null,

    FOREIGN KEY (cod_categoria) REFERENCES categorias(codigo) ON DELETE SET NULL ON UPDATE CASCADE, 
    FOREIGN KEY (cod_autor) REFERENCES autoresprincipais(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

--Criando a tabela amigos
CREATE TABLE amigos(
    codigo smallint PRIMARY KEY,
    nome varchar(100) not null,
    logradouro varchar(100) not null,
    bairro varchar(40) not null,
    fone_celular varchar(9) not null,
    tipo varchar(20) not null
);

--Criando a tabela emprestimos
CREATE TABLE emprestimos(
    num_emprestimo smallint PRIMARY KEY,
    data_emprestimo date not null,
    cod_amigo smallint not null,
    cod_livro smallint not null,

    FOREIGN KEY (cod_amigo) REFERENCES amigos(codigo) ON DELETE CASCADE,
    FOREIGN KEY (cod_livro) REFERENCES livros(codigo) ON DELETE CASCADE
);

--Inserindo dados no Banco de Dados 'ControleEmprestimosPessoais'
insert into categorias values
(1, 'Banco de Dados'),
(2, 'IA'),
(3, 'Programação'),
(4, 'Redes de Computadores'),
(5, 'Engenharia de Software');

insert into autoresprincipais values
(1, 'Carlos Araújo'),
(2, 'Bianca Santos Amaral'),
(3, 'Bruna Barbosa Sá'),
(4, 'Paulo Gustavo Camargo'),
(5, 'Pedro Silva Gomes');

insert into livros values
(0, 'Sprint Google', 199.99, 1, 1, 109, 'Emprestado', 5, 5),
(1, 'Sistemas de BD', 199.99, 1, 1, 99, 'Emprestado', 1, 1),
(2, 'Mangá para projetistas BD', 85.99, 1, 1, 99, 'Danificado', 1, 2),
(3, 'SQL para Iniciantes', 97.99, 1, 1, 145, 'Emprestado', 1, 3),
(4, 'NoSQL desvendando', 176.99, 1, 1, 999, 'Emprestado', 1, 4),
(5, 'Manual de BD para usuários do Oracle', 95.99, 1, 1, 788, 'Reservado', 1, 5),
(6, 'Mineração de Dados', 94.99, 1, 1, 203, 'Danificado', 2, 1),
(7, 'Algoritmos estruturados', 93.99, 1, 1, 133, 'Emprestado', 3, 2),
(8, 'Java para iniciantes', 92.99, 1, 1, 567, 'Reservado', 3, 3),
(9, 'UML para aplicações móveis', 91.99, 1, 1, 255, 'Emprestado', 5, 4),
(10, 'Aprendizado de Máquina', 90.99, 1, 1, 189, 'Danificado', 2, 5),
(11, 'Pynthon Avançado', 89.99, 1, 1, 666, 'Reservado', 3, 4),
(12, 'Scrum Master', 999.99, 1, 1, 129, 'Danificado', 5, 2),
(13, 'Código Limpo', 9953.99, 1, 1, 234, 'Reservado', 3, 2),
(15, 'Modelagem e Projeto de BD', 992.99, 1, 1, 499, 'Danificado', 1, 1),
(16, 'Programação Web', 990.99, 1, 1, 321, 'Emprestado', 3, 1),
(17, 'A biblia do C++', 299.99, 1, 1, 609, 'Reservado', null, 5);


insert into amigos values
(1, 'João Paulo Silva', 'Av. Santos Dumont', 'Centro', '123456789', 'Universitário'),
(2, 'Ana Clara Barbosa', 'Alegrim Dourado', 'São Clemente', '123456789', 'Profissional'),
(3, 'Célio Pimentel', 'Tarcísio da Silva Lopes', 'Engenho do Meio', '123456789', 'Pessoal'),
(4, 'Sofia Amaral', 'Mon Senhor III', 'Castanheiras', '123456789', 'Universitário'),
(5, 'Alberto Camargo', 'São Sebastião', 'Esperança', '123456789', 'Pessoal');

insert into emprestimos values
(1, '2022-09-25', 1, 1),
(2, '2022-08-21', 1, 2),
(3, '2022-07-23', 1, 4),
(4, '2022-09-13', 1, 5),
(5, '2022-08-12', 1, 7),
(6, '2022-07-09', 1, 8),
(7, '2022-08-08', 1, 9),
(8, '2022-07-16', 2, 4),
(9, '2022-06-11', 3, 5),
(10, '2022-05-22', 3, 2),
(11, '2022-04-15', 3, 13),
(12, '2022-03-17', 4, 12),
(13, '2022-02-14', 2, 11),
(14, '2022-01-28', 2, 10);

-- 1ª Questão Prata - Letra F
SELECT livros.titulo, categorias.descricao, autoresprincipais.nome
FROM livros
INNER JOIN categorias ON categorias.codigo = livros.cod_categoria
INNER JOIN autoresprincipais ON autoresprincipais.codigo = livros.cod_autor
WHERE livros.situacao NOT LIKE 'Emprestado';

SELECT livros.titulo, categorias.descricao, autoresprincipais.nome
FROM livros
LEFT JOIN categorias ON categorias.codigo = livros.cod_categoria
LEFT JOIN autoresprincipais ON autoresprincipais.codigo = livros.cod_autor
WHERE livros.situacao NOT LIKE 'Emprestado';

-- 2ª Questão Prata - Letra F
SELECT l.titulo, c.descricao
FROM livros l
LEFT JOIN categorias c ON c.codigo = l.cod_categoria;

-- 3ª Questão Prata - Letra H
SELECT a.codigo, a.nome, a.tipo
FROM amigos a
LEFT JOIN emprestimos e ON e.cod_amigo = a.codigo
WHERE e.cod_amigo IS NULL;


-- 1ª Questão Ouro - Letra I
SELECT livros.titulo, livros.preco, livros.edicao, categorias.descricao
FROM livros
LEFT JOIN categorias ON categorias.codigo = livros.cod_categoria
WHERE livros.situacao = (SELECT l.situacao FROM livros l WHERE l.titulo LIKE 'Sprint Google')
      AND livros.titulo NOT LIKE 'Sprint Google';

-- 2ª Questão Ouro - Letra J
SELECT emprestimos.num_emprestimo, emprestimos.data_emprestimo, amigos.nome, livros.titulo
FROM emprestimos
INNER JOIN amigos ON amigos.codigo = emprestimos.cod_amigo
INNER JOIN livros ON livros.codigo = emprestimos.cod_livro
WHERE extract(month from emprestimos.data_emprestimo) = 7;



