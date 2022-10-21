--em progresso

CREATE OR REPLACE FUNCTION numVogais(cod integer) 
RETURNS integer AS $$

DECLARE
    num_vogais int = 0;
    nome varchar;
    i int = 0;

BEGIN
    select f.nome from funcionarios f where codigo=$1 INTO nome;

    FOR i IN 1..17 LOOP
        if(REGEXP_LIKE(letra,'^[a-e-i-o-u]$')) then
        num_vogais = num_vogais + 1;
        END IF
    END LOOP;
    
    RETURN num_vogais;
    --return nome_func;
END
$$ LANGUAGE plpgsql;

select numVogais(7);
