--Finalizado

drop function getResponsavel(nome_fazenda varchar);

CREATE OR REPLACE FUNCTION getResponsavel(nome_fazenda varchar)
RETURNS text AS $$

select func.nome from funcionarios func

inner join fazendas f on f.codfuncResp = func.codigo where f.nome = $1;

$$ LANGUAGE sql;

select getResponsavel('Tapajoara');