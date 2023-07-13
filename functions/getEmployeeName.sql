CREATE FUNCTION getEmployeeName (p_employee_id IN NUMBER) 
RETURN VARCHAR2 
IS 
  employee_name VARCHAR2(100);
BEGIN
  SELECT first_name || ' ' || last_name 
  INTO employee_name 
  FROM employees 
  WHERE employee_id = p_employee_id;

  RETURN employee_name;
EXCEPTION 
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;
