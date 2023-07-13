DECLARE
    my_cursor SYS_REFCURSOR;
    my_record employees%ROWTYPE;
BEGIN
    -- Llamada al procedimiento almacenado
    get_employees_by_status('ACTIVE', my_cursor);
  
    -- Bucle para recuperar las filas
    LOOP
        -- Obtener la siguiente fila
        FETCH my_cursor INTO my_record;
        
        -- Salir del bucle si no hay más filas
        EXIT WHEN my_cursor%NOTFOUND;
        
        -- Imprimir el registro de empleado
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || my_record.employee_id || ', Firstname: ' || my_record.firstname || ', Lastname: ' || my_record.lastname || ', Hire Date: ' || TO_CHAR(my_record.hire_date, 'DD-MON-YYYY') || ', Salary: ' || my_record.salary || ', Status: ' || my_record.status);
    END LOOP;
  
    -- Cerrar el cursor
    CLOSE my_cursor;
END;
