-- finalizada
DROP FUNCTION getQtdFuncionarios(nome_fazenda varchar);

CREATE OR REPLACE FUNCTION getQtdFuncionarios(nome_fazenda varchar)
    RETURNS integer AS $$

    DECLARE
        qtd_func integer;

    BEGIN
        select count(codigoFunc)
        from funcionarios_fazendas func_f 
        inner join funcionarios f on func_f.codigoFunc = f.codigo

        ---where fazendas.nome = nome_fazenda 
        --INTO qtd_func;
        
        where codFazenda = (select fazendas.codigo from fazendas where fazendas.nome = $1)INTO qtd_func;
        --where codFazenda = 3 INTO qtd_func;
    RETURN qtd_func;
    END
$$ LANGUAGE plpgsql; 

select getQtdFuncionarios('Santa Terezinha');