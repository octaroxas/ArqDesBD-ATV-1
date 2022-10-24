drop function cpf_validate(cpf dm_cpf);

CREATE OR REPLACE FUNCTION sumDigits(counter_i integer, counter_j integer, digits_str varchar)
RETURNS integer as $$

    DECLARE
        i integer := counter_i;
        j integer := counter_j;
        digits_sum integer := 0;
    BEGIN
        FOR i in 1..LENGTH(digits_str) LOOP
            digits_sum := digits_sum + (cast(substr(digits_str,i,1) as integer) * j);
            j := j - 1;
        END LOOP;
    return digits_sum;
END
$$ LANGUAGE plpgsql;

--validate digit
CREATE or REPLACE FUNCTION validate_digit(restDivision integer) 
RETURNS integer as $$

    DECLARE
        digit integer;

    BEGIN
    IF (restDivision < 2) THEN
            digit := 0;
        ELSE 
            digit := 11 - restDivision;
        END IF;
    return digit;
END
$$ LANGUAGE plpgsql;


--validate cpf
CREATE OR REPLACE FUNCTION cpf_validate(cpf dm_cpf)
RETURNS text AS $$

DECLARE
    digit_one integer;
    digit_two integer;
    digits_sum integer := 0;
    digits varchar;
    isValid text;
 
BEGIN

    --digits := substr(cpf,i,9);
    digits := substr(cpf,1,9);

    digits_sum := sumDigits(1,10,digits);
    digit_one := validate_digit(digits_sum%11);

    digits := CONCAT(digits, digit_one);

    -- Caso o primeiro digito esteja errado, nenhum cálculo adicional é realizado, retornando assim CPF inválido
    IF(substr(digits,10,1) != cast(digit_one as char)) THEN
        isValid := 'CPF inválido';
        return isValid;
    END IF;

    -- Reatribuição da variavel de soma de digitos
    digits_sum := 0;

    digits_sum := sumDigits(1,11,digits);
    digit_two := validate_digit(digits_sum%11);

    digits := CONCAT(digits, digit_two);

    IF digits = cpf THEN
        isValid := 'O CPF informado é válido';
    ELSE
        isValid := 'CPF inválido';
    end IF;

    --return CONCAT(digit_one,digit_two);
    return isValid;
END
$$ LANGUAGE plpgsql;

--select cpf_validate('02485083266');
select cpf_validate('63545993272');
