DECLARE 
    first_name VARCHAR2(50);
    last_name VARCHAR2(50);
    salary NUMBER;
    hire_date DATE;
BEGIN
  FOR i IN 1..20 LOOP
    first_name := DBMS_RANDOM.STRING('A', 10);
    last_name := DBMS_RANDOM.STRING('A', 10);
    salary := DBMS_RANDOM.VALUE(30000, 80000);
    hire_date := SYSDATE - DBMS_RANDOM.VALUE(1, 3650);
    INSERT INTO employees (firstname, lastname, salary, hire_date)
    VALUES (first_name, last_name, salary, hire_date);
  END LOOP;
  COMMIT;
END;