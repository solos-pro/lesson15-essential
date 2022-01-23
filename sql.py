import sqlite3

con = sqlite3.connect("animal.db")
cursor = con.cursor()
query = """
        CREATE TABLE colors (
        id integer PRIMARY KEY AUTOINCREMENT,
        name varchar (30))
"""

cursor.execute(query)
con.close()

# create table animal_color (
#     color_id int
#    ,animal_id int)
#
# insert into animal_color (
#     select * from animals
# )