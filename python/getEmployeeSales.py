import oracledb

un = 'rrhh'
pw = 'rrhh'
cs = '10.0.3.80:1521/wdesa2'

stored_procedure = "EMPLOYEE_PKG.getEmployeeSales"

with oracledb.connect(user=un, password=pw,dsn=cs) as connection:
    with connection.cursor() as cursor:
        # Crear el parámetro de salida
        p_cursor = cursor.var(oracledb.CURSOR)
        p_employee_id = str(10)

        cursor.callproc(stored_procedure, [p_employee_id,p_cursor])
        result = p_cursor.getvalue()
        for row in result:
            print(row)
