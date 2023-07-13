CREATE OR REPLACE VIEW active_employees AS
SELECT
    employee_id as codigo,
    firstname Nombres,
    lastname Apellido,
    hire_date as Fecha_inicio   
FROM
    employees 
where
    upper(status)=upper('active');
