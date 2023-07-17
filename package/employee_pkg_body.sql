CREATE OR REPLACE PACKAGE BODY employee_pkg IS
  -- Implementación de la función
  FUNCTION getEmployeeName(p_employee_id IN NUMBER) 
    RETURN VARCHAR2 
  IS 
    employee_name VARCHAR2(100);
  BEGIN
    SELECT firstname || ' ' || lastname 
    INTO employee_name 
    FROM employees 
    WHERE employee_id = p_employee_id;
  
    RETURN employee_name;
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
  END getEmployeeName;

  -- Implementaciones de los procedimientos
  PROCEDURE updateEmployeeSalary(p_employee_id IN NUMBER, p_new_salary IN NUMBER) 
  IS
  BEGIN
    UPDATE employees
    SET salary = p_new_salary
    WHERE employee_id = p_employee_id;

    COMMIT;
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No se encontró ningún empleado con el ID proporcionado.');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Ocurrió un error al intentar actualizar el salario del empleado.');
  END updateEmployeeSalary;

  PROCEDURE getEmployeeList(p_cursor OUT SYS_REFCURSOR)
  IS
  BEGIN
    OPEN p_cursor FOR
    SELECT * FROM employees;
  END getEmployeeList;


  PROCEDURE print_employee_details (employee_id_in NUMBER) IS
    employee_name VARCHAR2(50);
  BEGIN
    employee_name := get_employee_name(employee_id_in);
    DBMS_OUTPUT.PUT_LINE('Employee name: ' || employee_name);
  END print_employee_details;
  
END employee_pkg;
/
