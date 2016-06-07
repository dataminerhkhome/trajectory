import psycopg2

try:
    connect_str = "dbname='trajectory_dev' user='postgres' host='localhost' " + \
                  "password='postgres'"
    # use our connection values to establish a connection
    conn = psycopg2.connect(connect_str)
    # create a psycopg2 cursor that can execute queries
    cursor = conn.cursor()
    # create a new table with a single column called "name"
#     cursor.execute("""CREATE TABLE tutorials (name char(40));""")
    # run a SELECT statement - no data in there, but we can try it
    cursor.execute("""INSERT INTO strokes (velocity, angle, height, rise_time) VALUES (30, 30, 3.0, 1.2) returning id;""")
    rows = cursor.fetchone()
    print(rows)
except Exception as e:
    print(e)
    