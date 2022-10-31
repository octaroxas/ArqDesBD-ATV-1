--insert into usuario values(id, nm_login, ds_senha, fg_bloqueado, nu_tentativa_login)
drop trigger trg_validate_passsword on usuario;

drop FUNCTION validate_password();

CREATE OR REPLACE FUNCTION validate_password() 
RETURNS TRIGGER AS $$

    DECLARE
        senha varchar := NEW.ds_senha;
    BEGIN
        IF LENGTH(NEW.ds_senha) < 8 THEN
        RAISE EXCEPTION 'Senha deve ter no minimo 8 caracteres';
        end IF;

        IF NEW.ds_senha IS NULL OR NEW.ds_senha='' THEN
            RAISE EXCEPTION 'Senha não pode ser vazia';
        END IF;

        IF REGEXP_MATCHES(NEW.ds_senha,'([0-9]+)','g') THEN
        RETURN NEW;
        else
        RAISE EXCEPTION 'Senha deve cumprir os requisitos';
        end if;
        
        --RETURN NEW;
        --NEW.ds_senha := 'senha1234';
    END
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validate_passsword BEFORE INSERT
ON usuario FOR EACH ROW
EXECUTE PROCEDURE validate_password();

insert into usuario values(5, 'octa', '12333333', false, 0);


select * from usuario;
