
--inserindo registros na tabela funcionarios
INSERT INTO funcionarios VALUES 
    (1, 'Cesar Lopes', 'M', 1400, '13/01/1991', 'Vaqueiro', false),
    (2, 'Jonas Matos Sousa', 'M', 4500.00, '03/11/1972', 'Cowboy', true),
    (3, 'Walter Pereira', 'M', 4000.00, '10/09/1970', 'Capataz', true),
    (4, 'Ana Silva', 'F', 1900.00, '11/07/1969', 'Vaqueiro', true),
    (5, 'Gustavo Lopes', 'M', 3500.00, '22/07/1980', 'Capataz', true),
    (6, 'Fabricio Peixoto', 'M', 1400.00, '15/01/1981', 'Vaqueiro', false)
;

--Inserindo registros na tabela fazendas
INSERT INTO fazendas (codigo, nome, area, localizacao, codfuncresp) VALUES
    (1, 'Bela Vista do Campo', 1234.45, 'Região do Lago Grande', 4 ),
    (2, 'Santa Terezinha', 9834.45, 'Região do Lago Grande', 4 ),
    (3, 'Só despesa', 8234.85, 'Ituqui', 6),
    (4, 'Tapajoara', 5634.05, 'Tapará', 6)
;

--Inserindo registros na tabela funcionarios_fazendas
INSERT INTO funcionarios_fazendas VALUES
    (1, 1, '10/02/2000', '11/09/2002'),
    (2, 1, '11/03/2002', '22/04/2006'),
    (3, 2, '21/10/2008', null),
    (4, 2, '10/05/2015', null),
    (5, 3, '03/11/2012', '07/10/2013'),
    (6, 3, '15/08/2009', null)
;

--Inserindo dados na tabela lotes
INSERT INTO lotes VALUES
    (1,'lote Nelore e Gir', 1, 1), 
    (2,'lote de animais da raça Sindi', 2, 1),
    (3,'lote de animais da raça Indubrasil e Sindi', 5, 3),
    (4,'lote Misto', 6, 4)
;

INSERT INTO racas VALUES
    (1,'Nelore'), 
    (2,'Guzerá'),
    (3,'Gir'),
    (4,'Cangaian'),
    (5,'Angus'),
    (6,'Sindi'),
    (7,'Indubrasil')
;

--Inserindo dados na tabela animais
INSERT INTO animais VALUES 
    (1, 'Estrela', 1, 'F', '13/01/2016', 1, 2),
    (2, 'Malhado', 1, 'M', '03/11/2015', 1, 0),
    (3, 'Trovão', 3, 'M','10/09/2016', 2, 2),
    (4, 'Mimosa do Sertão', 1, 'F', '11/07/2017', 1, 0),
    (5, 'Pérola Negra', 7, 'F', '02/07/2016', 3,3)
;

--Inserindo dados em animais_caracteristicas
INSERT INTO animais_caracteristicas VALUES
	(1, 'estrela na testa'),
	(2, 'manchas amareladas na pele'),
    (2, 'reprodutor'),
	(5, 'pata trasseira com defeito'),
	(4, 'sem chifre')
;
