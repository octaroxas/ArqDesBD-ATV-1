--Finalizado
drop function getfuncionario(codigo integer);

CREATE OR REPLACE FUNCTION getfuncionario(codigo integer) 
RETURNS setof funcionarios AS $$
    SELECT * FROM funcionarios WHERE codigo=$1;
$$ LANGUAGE SQL;

select getfuncionario(1);