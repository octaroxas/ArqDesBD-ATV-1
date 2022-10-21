--finalizada
drop FUNCTION mesAniversario(cod integer);
CREATE OR REPLACE FUNCTION mesAniversario(cod integer)
    RETURNS text AS $$

    DECLARE 
        mes varchar;
        month_name varchar;
begin

    select extract(month from (select f.dataNascimento from funcionarios f  where f.codigo = $1)) into mes;
    
    IF mes = '1' then 
    return 'Janeiro';
     ELSIF mes = '2' then 
     return 'Fevereiro';
     ELSIF mes = '3' then 
     return 'Março';
     ELSIF mes = '4' then 
     return 'Abril';
     ELSIF mes = '5' then 
     return 'Maio';
     ELSIF mes = '6' then 
     return 'Junho';
     ELSIF mes = '7' then 
     return 'Julho';
     ELSIF mes = '8' then 
     return 'Agosto';
     ELSIF mes = '9' then 
     return 'Setembro';
     ELSIF mes = '10' then 
     return 'Outubro';
     ELSIF mes = '11' then 
     return 'Novembro';
     ELSIF mes = '12' then 
     return 'Dezembro';
     end if
end;
$$ LANGUAGE plpgsql; 

select mesAniversario(2);