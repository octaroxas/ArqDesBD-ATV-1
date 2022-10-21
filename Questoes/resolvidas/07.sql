--finalizada

CREATE OR REPLACE FUNCTION numVogais(cod integer) 
RETURNS integer AS $$

DECLARE
    num_vogais int = 0;
    nome varchar;
    i int = 0;
    le varchar;

BEGIN
    select f.nome from funcionarios f where codigo=$1 INTO nome;
    FOR i IN 1..LENGTH(nome) LOOP
        if substr(nome,i,1) in ('a','e','i','o','u','A','E','I','O','U') then
        num_vogais := num_vogais + 1;
        END IF;
    END LOOP;
    
    RETURN num_vogais;
END
$$ LANGUAGE plpgsql;

select numVogais(2);
