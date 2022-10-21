--em progresso

CREATE OR REPLACE FUNCTION signo(cod integer) 
RETURNS text AS $$

DECLARE
    signo varchar;
    nascimento varchar; 
BEGIN

SELECT f.dataNascimento FROM funcionarios f where f.codigo = $1 into nascimento;
--return nascimento;
--1981-01-15

IF (substr(nascimento,6,5) BETWEEN '12-22' AND '01-20') 
RETURN 'Capricórnio';
END IF;

END
$$ LANGUAGE plpgsql;


select signo(7);