--em progresso

CREATE OR REPLACE FUNCTION numVogais(cod integer) 
RETURNS text AS $$

DECLARE
    num_vogais integer;
    nome_func varchar;

BEGIN
    select f.nome from funcionarios f where codigo=$1 INTO nome_func;

    nome_func = ;

    FOR letra IN nome_func LOOP
    if(REGEXP_LIKE(letra,'^[a-e-i-o-u]$'))
    num_vogais = num_vogais + 1;
    END LOOP 
    RETURN num_vogais;
END
$$ LANGUAGE plpgsql;

select numVogais(1);
