DECLARE 
  first_names VARCHAR2(32767) := 'John,Mary,Steve,Emily,Robert,Karen,Paul,Emma,David,Linda,AnaIsabel,Monica,Daniel,Erick,Douglas';
  last_names VARCHAR2(32767) := 'Smith,Johnson,Williams,Brown,Jones,Miller,Davis,Garcia,Rodriguez,Wilson,Palma,Par,Paiz,Ruiz';
  first_name VARCHAR2(50);
  last_name VARCHAR2(50);
  salary NUMBER;
  hire_date DATE;
  random_index_first_name NUMBER;
  random_index_last_name NUMBER;
BEGIN
  FOR i IN 1..20 LOOP
    random_index_first_name := TRUNC(DBMS_RANDOM.VALUE(1, 11));
    random_index_last_name := TRUNC(DBMS_RANDOM.VALUE(1, 11));
    first_name := SUBSTR(first_names, 
                         INSTR(first_names || ',', ',', 1, random_index_first_name) + 1, 
                         INSTR(first_names || ',', ',', 1, random_index_first_name + 1) - 
                         INSTR(first_names || ',', ',', 1, random_index_first_name) - 1);
    last_name := SUBSTR(last_names, 
                        INSTR(last_names || ',', ',', 1, random_index_last_name) + 1, 
                        INSTR(last_names || ',', ',', 1, random_index_last_name + 1) - 
                        INSTR(last_names || ',', ',', 1, random_index_last_name) - 1);
    salary := TRUNC(DBMS_RANDOM.VALUE(30000, 80000) * 100) / 100;
    hire_date := SYSDATE - DBMS_RANDOM.VALUE(1, 3650);
    INSERT INTO employees (firstname, lastname, salary, hire_date)
    VALUES (first_name, last_name, salary, hire_date);
  END LOOP;
  COMMIT;
END;
