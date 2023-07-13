SELECT
    employee_id,
    getEmployeeName(employee_id)
FROM
    employees;


SELECT
    order_id,
    getEmployeeName(employee_id),
    order_date,
    order_total
FROM
    orders;
