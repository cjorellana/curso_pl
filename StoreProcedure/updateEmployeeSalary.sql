CREATE OR REPLACE PROCEDURE updateEmployeeSalary (p_employee_id IN NUMBER, p_new_salary IN NUMBER) 
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
END;