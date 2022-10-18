/*
 Script criado para a criação do banco de dados da Fazenda
 Data Criação: 10/10/2022
 Disciplina: Arquitetura e Desempenho BD   ano: 2022 
*/

--domínio para atributos de gênero
CREATE DOMAIN dm_sexo AS char(1)
DEFAULT 'M'
NOT NULL
CHECK (VALUE IN ('M', 'F'));

--domínio para atributos data 
CREATE DOMAIN dm_data AS date
DEFAULT '01/01/1900'
CHECK ( VALUE > '01/01/1900');

--domínio para atributos do tipo nome 
CREATE DOMAIN dm_nome AS varchar(60) 
NOT NULL;

--tipo ENUM para funcao
CREATE TYPE enum_funcao AS ENUM ('Capataz', 'Cowboy', 'Vaqueiro');

--Criando a tabela funcionarios
CREATE TABLE funcionarios (
   codigo integer, 
   nome dm_nome, 
   sexo dm_sexo, 
   salario real CHECK(salario >= 1024.00), 
   dataNascimento dm_data, 
   funcao enum_funcao DEFAULT 'Vaqueiro',
   experiencia boolean,
   CONSTRAINT funcionarios_pk PRIMARY KEY (codigo)
);

--Criando a tabela fazendas
CREATE TABLE fazendas (
    codigo integer, 
    nome dm_nome, 
    area numeric(6,2) NOT NULL, 
    localizacao varchar(40) NOT NULL, 
    valor_estimado numeric(8,2),
    codFuncResp integer,
    CONSTRAINT fazendas_pk PRIMARY KEY (codigo),
    CONSTRAINT fazendas_funcionarios_fk FOREIGN KEY (codFuncResp) REFERENCES funcionarios(codigo)
);

--Criando a tabela funcionarios_fazendas
CREATE TABLE funcionarios_fazendas (
    codigoFunc integer, 
    codFazenda integer, 
    dataInicioContrato dm_data,
    dataFimContrato dm_data,
    CONSTRAINT funcionarios_fazendas_pk PRIMARY KEY (codigoFunc, codFazenda, dataInicioContrato),
    CONSTRAINT funcionarios_fazendas_funcionarios_fk FOREIGN KEY (codigoFunc) REFERENCES funcionarios(codigo),
    CONSTRAINT ff_fazendas_fk FOREIGN KEY (codFazenda) REFERENCES fazendas(codigo)
);

--Criando a tabela lotes
CREATE TABLE lotes (
    idLote integer, 
    descricao dm_nome, 
    codFuncResp integer, 
    codFazenda integer,
    CONSTRAINT lotes_pk PRIMARY KEY (idLote),
    CONSTRAINT lotes_funcionarios_fk FOREIGN KEY (codFuncResp) REFERENCES funcionarios(codigo),
    CONSTRAINT lotes_fazendas_fk FOREIGN KEY (codFazenda) REFERENCES fazendas(codigo)    
);

--Criando a tabela racas
CREATE TABLE racas (
   codigo integer, 
   nome dm_nome,
   CONSTRAINT racas_pk PRIMARY KEY (codigo)
);
 
--Criando a tabela Animais
CREATE TABLE animais(
    codigo integer, 
    nome dm_nome, 
    cod_raca integer, 
    sexo dm_sexo, 
    dataNascimento dm_data, 
    idLote integer, 
    codPai integer,
    CONSTRAINT animais_pk PRIMARY KEY (codigo),
    CONSTRAINT animais_racas_fk FOREIGN KEY (cod_raca) REFERENCES racas(codigo), 
    CONSTRAINT animais_lotes_fk FOREIGN KEY (idLote) REFERENCES lotes(idLote)       
);

--Criando a tabela animais_caracteristicas
CREATE TABLE animais_caracteristicas(
    codAnimal integer, 
    caracteristica varchar (50) NOT NULL,
    CONSTRAINT animais_caracteristicas_pk PRIMARY KEY (codAnimal, caracteristica)
);

--Criando a tabela animais_mortos
CREATE TABLE animais_mortos(
   codigo integer, 
   nome dm_nome, 
   cod_raca integer, 
   motivoMorte varchar(100) NOT NULL, 
   dataMorte dm_data,
   CONSTRAINT animais_mortos_pk PRIMARY KEY(codigo)
);