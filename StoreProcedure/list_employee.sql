CREATE OR REPLACE PROCEDURE get_employees_by_status
(
    p_status IN employees.status%TYPE,
    RetVal     out sys_refcursor
)
AS
   
BEGIN
    -- Abrir el cursor
    OPEN RetVal FOR
    SELECT 
    employee_id,
    firstname,
    lastname,
    hire_date,
    salary,
    status
    FROM employees
    WHERE status = p_status;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
