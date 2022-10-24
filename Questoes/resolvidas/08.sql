--finalizado
CREATE OR REPLACE FUNCTION getPai(cod_animal integer)
RETURNS text AS $$

select a.nome from animais a 
where a.codigo = (select animais.codPai from animais where animais.codigo = $1);

$$ LANGUAGE sql;

select getPai(5);