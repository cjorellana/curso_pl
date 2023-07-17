create or replace PACKAGE BODY employee_pkg IS
/* Funciones */

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

  /* SP */
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
  
  /*listar empleados*/
  PROCEDURE getEmployeeList(p_cursor OUT SYS_REFCURSOR)
  IS
  BEGIN
    OPEN p_cursor FOR
    SELECT * FROM employees;
  END getEmployeeList;


END employee_pkg;
