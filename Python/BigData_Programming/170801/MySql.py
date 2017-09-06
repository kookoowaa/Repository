import pymysql

conn = pymysql.connect(host = 'localhost', user = 'root', password = 'fdjk1120', db = 'world')

curs = conn.cursor()

sql_query = 'select * from employee'
curs.execute(sql_query)

rows = curs.fetchall()
print(rows)

conn.close()