DECLARE 
    order_total NUMBER;
    order_date DATE;
    employee_id NUMBER;
    status VARCHAR2(20);
    num_employees NUMBER;
BEGIN
  SELECT COUNT(*) INTO num_employees FROM employees;
  
  IF num_employees > 0 THEN
    FOR i IN 1..100 LOOP
      SELECT employee_id INTO employee_id FROM (
        SELECT employee_id FROM employees
        ORDER BY DBMS_RANDOM.RANDOM)
      WHERE ROWNUM = 1;
      
      order_total := DBMS_RANDOM.VALUE(100, 5000);
      order_date := SYSDATE - DBMS_RANDOM.VALUE(1, 365);
      
      IF DBMS_RANDOM.VALUE(1, 10) > 3 THEN
        status := 'SHIPPED';
      ELSE
        status := 'PENDING';
      END IF;
      
      INSERT INTO orders (employee_id, order_total, order_date, status)
      VALUES (employee_id, order_total, order_date, status);
    END LOOP;
    COMMIT;
  ELSE
    DBMS_OUTPUT.PUT_LINE('No employees in the database to create orders for.');
  END IF;
END;
/
