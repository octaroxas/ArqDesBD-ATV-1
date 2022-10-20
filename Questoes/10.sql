--EM PROGRESS
CREATE OR REPLACE FUNCTION mesAniversario(cod integer)
    RETURNS text AS $$

    --select  (dataNascimento) from funcionarios f where codigo = $1;
MONTHNAME('1981-01-15');
    --select extract(month from f.dataNascimento)  from funcionarios f where codigo = $1;
$$ LANGUAGE sql; 

select mesAniversario(7);