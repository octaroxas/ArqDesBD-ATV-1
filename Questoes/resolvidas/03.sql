--finalizada
drop function totalSalario(func varchar);

CREATE OR REPLACE FUNCTION totalSalario(func enum_funcao) 
RETURNS real AS $$
    SELECT Sum(f.salario) FROM funcionarios f WHERE funcao=$1;
$$ LANGUAGE SQL;

select totalSalario('Cowboy');
