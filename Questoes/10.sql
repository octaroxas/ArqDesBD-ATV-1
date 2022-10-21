drop FUNCTION mesAniversario(cod integer);
CREATE OR REPLACE FUNCTION mesAniversario(cod integer)
    RETURNS text AS $$

    DECLARE 
        mes varchar;
        month_name varchar;
begin

    select extract(month from (select f.dataNascimento from funcionarios f  where f.codigo = $1)) into mes;
    select case
    when mes = '1' then 'Janeiro'
     when mes = '2' then 'Fevereiro'
     when mes = '3' then 'Março'
     when mes = '4' then 'Abril'
     when mes = '5' then 'Maio'
     when mes = '6' then 'Junho'
     when mes = '7' then 'Julho'
     when mes = '8' then 'Agosto'
     when mes = '9' then 'Setembro'
     when mes = '10' then 'Outubro'
     when mes = '11' then 'Novembro'
     when mes = '12' then 'Dezembro'
    else
     end
end;
$$ LANGUAGE plpgsql; 

select mesAniversario(7);