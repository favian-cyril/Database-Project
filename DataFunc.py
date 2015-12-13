import psycopg2
import datetime

conn = psycopg2.connect("dbname=Gujek user=postgres password=123")
cur = conn.cursor()

def insert(schema, table, *values):
    """
    insert a value into a table. The values must be in the correct order as the table
    """
    cur.execute("INSERT INTO {}.{} VALUES {};".format(schema,table,values))
    conn.commit()

def delete(schema, table, condition):
    """
    Delete a value from a table. Condition must always be the first column which is the
    primary key
    """
    meta = getMetaData(schema, table)
    pkey = meta[0][0]
    cur.execute("DELETE FROM {}.{} WHERE {}='{}';".format(schema,table,pkey,condition))
    conn.commit()

def update(schema, table, condition, *values):
    """
    Update a value in a table. Condition is the first column and values must be
    the whole value even though it is not changed
    """
    meta = getMetaData(schema, table)
    pkey = meta[0][0]
    cur.execute("UPDATE {}.{} SET {} WHERE {}='{}';".format(schema,table,values,pkey,condition))
    conn.commit()

def showTable(schema, table):
    """
    Display table with the header values
    """
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
    """
    get the meta data from a table
    """
    cur.execute("SELECT column_name, data_type, character_maximum_length\
            FROM INFORMATION_SCHEMA.COLUMNS where table_name = '{}';".format(table))
    meta = cur.fetchall()
    return meta

def closeConnection():
    """
    Close connection to database
    """
    curr.close()
    conn.close()
