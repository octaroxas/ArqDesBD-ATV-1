
--Finalizado

CREATE OR REPLACE FUNCTION getIdadeFuncionario(codigo integer) 
RETURNS text AS $$
    SELECT extract(year from funcionarios.dataNascimento) FROM funcionarios WHERE codigo=$1;
$$ LANGUAGE SQL;

select getIdadeFuncionario(1);