--em progresso

CREATE OR REPLACE FUNCTION signo(cod integer) 
RETURNS varchar AS $$

DECLARE
    signo varchar;
    nascimento varchar; 
BEGIN

SELECT f.dataNascimento FROM funcionarios f where f.codigo = $1 into nascimento;
--return nascimento;
--1981-01-15

SELECT FORMAT

END
$$ LANGUAGE plpgsql;


select signo(7);