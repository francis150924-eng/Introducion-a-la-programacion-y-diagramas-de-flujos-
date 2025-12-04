import mysql.connector

conexion1=mysql.connector.connect(host="localhost", 
                                  user="root", 
                                  passwd="", 
                                  database="bd1")
cursor1=conexion1.cursor()
sql="insert into articulos(descripcion, precio) values (%s,%s)"
filas=[ ("naranjas", 23.50),
        ("peras", 34),
        ("sandias", 21),
        ("banana", 19.60) ]
cursor1.executemany(sql, filas)
conexion1.commit()
conexion1.close()