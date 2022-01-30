from flask import Flask, request, abort, jsonify

app = Flask(__name__)


@app.route('/patient/<id>')
def sql_req(id):
    con = sqlite3.connect("animal.db")
    cursor = con.cursor()
    query = f"""
                 CREATE TABLE colors (
                 id integer PRIMARY KEY AUTOINCREMENT,
                 name varchar (30))
         """

    cursor.execute(query)
    result = cursor.fetchall()
    con.close()
    return jsonify()


if __name__ == '__main__':
    app.run(debug=True)
