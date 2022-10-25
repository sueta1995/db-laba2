CREATE FUNCTION employees_check() RETURNS trigger AS $employees_check$
    BEGIN
        -- Проверить, что указаны имя сотрудника и его должность
        IF NEW.full_name IS NULL THEN
            RAISE EXCEPTION 'Имя сотрудника не может быть NULL';
        END IF;
        IF NEW.function IS NULL THEN
            RAISE EXCEPTION '% не может иметь должность со значением NULL', NEW.empname;
        END IF;

        -- Проверка уникальности имени нового сотрудника
        IF NEW.full_name IN (SELECT full_name FROM employees) THEN
            RAISE EXCEPTION '% cannot have a negative salary', NEW.empname;
        END IF;
        
        RETURN NEW;
    END;
$employees_check$ LANGUAGE plpgsql;

CREATE TRIGGER employees_check BEFORE INSERT OR UPDATE ON employees
    FOR EACH ROW EXECUTE FUNCTION employees_check();
