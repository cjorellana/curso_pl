import oracledb
import os

un = 'rrhh'
pw = 'rrhh'
cs = 'localhost:1521/XE'

stored_procedure = "employee_pkg.getEmployeeList"

with oracledb.connect(user=un, password=pw,dsn=cs) as connection:
    with connection.cursor() as cursor:
        # Crear el parámetro de salida
        output = cursor.var(oracledb.CURSOR)
        cursor.callproc(stored_procedure, [output])
        result = output.getvalue()
        for row in result:
            print(row)