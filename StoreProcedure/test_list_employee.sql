DECLARE
  l_cursor SYS_REFCURSOR;
  l_record employees%ROWTYPE;
BEGIN
  getEmployeeList(l_cursor);
  
  LOOP
    FETCH l_cursor INTO l_record;
    EXIT WHEN l_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(l_record.employee_id || ' - ' || l_record.employee_name);
  END LOOP;
  
  CLOSE l_cursor;
END;
/