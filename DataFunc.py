import psycopg2
import datetime

conn = psycopg2.connect("dbname=Gujek user=postgres password=123")
cur = conn.cursor()

def insert(schema, table, *values):
    cur.execute("INSERT INTO {}.{} VALUES {};".format(schema,table,values))
    conn.commit()

def delete(schema, table, condition):
    meta = getMetaData(schema, table)
    pkey = meta[0][0]
    cur.execute("DELETE FROM {}.{} WHERE {}='{}';".format(schema,table,pkey,condition))
    conn.commit()

def showTable(schema, table):
    meta = getMetaData(schema, table)
    for rows in meta:
        print("{},".format(rows[0]),end='')
    print('\n')
    cur.execute("SELECT * FROM {}.{};".format(schema,table))
    data = cur.fetchall()
    for rows in data:
        for col in rows:
            print("{},".format(col),end='')
        print('\n')
        
def getMetaData(schema, table):
    cur.execute("SELECT column_name, data_type, character_maximum_length\
            FROM INFORMATION_SCHEMA.COLUMNS where table_name = '{}';".format(table))
    meta = cur.fetchall()
    return meta
