CREATE VIEW active_employees AS
SELECT *
FROM employees
WHERE status = 'ACTIVE';
