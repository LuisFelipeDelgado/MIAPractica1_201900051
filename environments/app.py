from flask import Flask, render_template
import psycopg2

app = Flask(__name__)

@app.route('/cargarTemporal')
def temporal():
    conn=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./cargarTemp.sql","r").read())
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return 'Datos a Temporal Cargados.'

@app.route('/cargarModelo')
def modeloER():
    conn=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./cargarMod.sql","r").read())
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return 'Modelo Cargado.'

@app.route('/consulta1')
def consulta1():
    conn=None
    prints=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./consulta1.sql","r").read())
        prints = cur.fetchall()
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return str(prints)

@app.route('/consulta2')
def consulta2():
    conn=None
    prints=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./consulta2.sql","r").read())
        prints = str(cur.rowcount) + ' Datos <br>  Nombre  |  Apellido  |   Pago total<br>'
        row = cur.fetchone()
        while row is not None:
            prints += str(row)+'<br>'
            row = cur.fetchone()
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return str(prints)

@app.route('/consulta3')
def consulta3():
    conn=None
    prints=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./consulta3.sql","r").read())
        prints = str(cur.rowcount) + ' Datos <br>  Actor<br>'
        row = cur.fetchone()
        while row is not None:
            prints += str(row)+'<br>'
            row = cur.fetchone()
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return str(prints)

@app.route('/consulta4')
def consulta4():
    conn=None
    prints=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./consulta4.sql","r").read())
        prints = str(cur.rowcount) + ' Datos <br>  Actor   |   Lanzamiento<br>'
        row = cur.fetchone()
        while row is not None:
            prints += str(row)+'<br>'
            row = cur.fetchone()
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return str(prints)

@app.route('/consulta5')
def consulta5():
    conn=None
    prints=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./consulta5.sql","r").read())
        prints = str(cur.rowcount) + ' Datos <br>  Cliente   |   Pais   |   Promedio<br>'
        row = cur.fetchone()
        while row is not None:
            prints += str(row)+'<br>'
            row = cur.fetchone()
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return str(prints)

@app.route('/consulta6')
def consulta6():
    conn=None
    prints=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./consulta6.sql","r").read())
        prints = str(cur.rowcount) + ' Datos <br>  Pais   |   Ciudades   |   Ciudad   |   Clientes   |   Porcentaje<br>'
        row = cur.fetchone()
        while row is not None:
            prints += str(row)+'<br>'
            row = cur.fetchone()
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return str(prints)

@app.route('/consulta7')
def consulta7():
    conn=None
    prints=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./consulta7.sql","r").read())
        prints = str(cur.rowcount) + ' Datos <br>  Pais   |   Ciudad   |   Promedio<br>'
        row = cur.fetchone()
        while row is not None:
            prints += str(row)+'<br>'
            row = cur.fetchone()
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return str(prints)

@app.route('/consulta8')
def consulta8():
    conn=None
    prints=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./consulta8.sql","r").read())
        prints = str(cur.rowcount) + ' Datos <br>  Pais   |   Total   |   Sports   |   Porcentaje<br>'
        row = cur.fetchone()
        while row is not None:
            prints += str(row)+'<br>'
            row = cur.fetchone()
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return str(prints)

@app.route('/consulta9')
def consulta9():
    conn=None
    prints=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./consulta9.sql","r").read())
        prints = str(cur.rowcount) + ' Datos <br>  Ciudad   |   Rentas<br>'
        row = cur.fetchone()
        while row is not None:
            prints += str(row)+'<br>'
            row = cur.fetchone()
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return str(prints)

@app.route('/consulta10')
def consulta10():
    conn=None
    prints=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./consulta10.sql","r").read())
        prints = str(cur.rowcount) + ' Datos <br>  Pais   |   Ciudad<br>'
        row = cur.fetchone()
        while row is not None:
            prints += str(row)+'<br>'
            row = cur.fetchone()
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return str(prints)

@app.route('/eliminarModelo')
def eliminarMod():
    conn=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./eliminarMod.sql","r").read())
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return 'Tablas del Modelo de Datos Eliminadas.'

@app.route('/eliminarTemporal')
def eliminarTemp():
    conn=None
    try:
        # read the connection parameters
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost",database="temps2",user="postgres",password="test123")        
        cur = conn.cursor()
        # create table one by one
        cur = conn.cursor()
        cur.execute(open("./eliminarTemp.sql","r").read())
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            return 'Datos de Tabla temporal Eliminados.'

@app.route('/')
def index():
    return 'Ingrese direccion'

if __name__ == '__main__':
    index()
