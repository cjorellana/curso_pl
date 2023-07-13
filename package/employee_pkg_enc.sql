CREATE OR REPLACE PACKAGE employee_pkg IS
  -- Especificación para la función
  FUNCTION getEmployeeName(p_employee_id IN NUMBER) RETURN VARCHAR2;

  -- Especificaciones para los procedimientos
  PROCEDURE updateEmployeeSalary(p_employee_id IN NUMBER, p_new_salary IN NUMBER);
  PROCEDURE getEmployeeList(p_cursor OUT SYS_REFCURSOR);
END employee_pkg;
/
