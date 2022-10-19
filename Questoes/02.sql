--Finalizado
drop function calcInss(cod integer);

CREATE OR REPLACE FUNCTION calcInss(cod integer) 
RETURNS real AS $$

DECLARE
    salario_funcionario real;
BEGIN
    SELECT salario from funcionarios where codigo=$1 INTO salario_funcionario;

    IF salario_funcionario<=2000 THEN 
        RETURN salario_funcionario*0.1;
    ELSIF salario_funcionario>2000 THEN
        RETURN salario_funcionario*0.15;
    END IF;
END;
$$ LANGUAGE plpgsql;

select calcInss(2);
