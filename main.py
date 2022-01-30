import sqlite3, flask
from flask import Flask, request, abort, jsonify

def connection_to_database(query, db):
    with sqlite3.connect(db) as connection:
        cur = connection.cursor()
        cur.row_factory = sqlite3.Row
        try:
            result = cur.execute(query)
            result = result.fetchall()
            result = [dict(ix) for ix in result]
            if len(result) > 0:
                return result
            else:
                return "Нет данных по запросу"
        except (sqlite3.Error, sqlite3.Warning) as er:
            return "SQLite3 error: %s" % (' '.join(er.args))



app = Flask(__name__)

@app.route('/animal/<idx>')
def animal(idx):
    query = f"""
        select A.id, A.animal_id, A.name, T.age, T.ageUnit, T.outcome_month, T.outcome_year, B.breed, C.color, typeAnimal.typeAnimal, outcomeType.outcomeType, outcomeSubtype.outcomeSubtype 
        from animal as A 
        inner join times as T ON A.id=T.id
        LEFT JOIN animal_breed as AB ON A.id=AB.animal_id
        LEFT JOIN breeds as B ON AB.breed_id=B.breed_id
        LEFT JOIN animal_color as AC ON A.animal_id=AC.animal_id
        LEFT JOIN colors as C ON AC.color_id=C.color_id
        LEFT JOIN animal_type as ATy ON A.id=ATy.animal_id
        LEFT JOIN typeAnimal ON ATy.type_id=typeAnimal.type_id 
        LEFT JOIN animal_outcomeType as AOT ON A.id=AOT.animal_id
        LEFT JOIN outcomeType ON AOT.outcomeType_id=outcomeType.outcomeType_id
        LEFT JOIN animal_outcomeSubtype as AOS ON A.id=AOS.animal_id
        LEFT JOIN outcomeSubtype ON AOS.outcomeSubtype_id=outcomeSubtype.outcomeSubtype_id 
        WHERE A.id IN ({idx})
    """
    result = connection_to_database(query, "animal.db")
    return flask.jsonify(result)


if __name__ == '__main__':
    app.run(debug=True)
