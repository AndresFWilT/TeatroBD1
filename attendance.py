from __main__ import app, session, redirect, cx_Oracle
from app import get_credentials_db


@app.route('/attendance', methods=['GET'])
def attendance():
    if not session.get("email"):
        return redirect("/loginTeacher")
    
    # Get play's students
    sqlGetStudents = f"""SELECT S.student_names, student_surnames
                         FROM student S, character_student CS, character C, play P
                             WHERE S.student_code = CS.student_code
                               AND CS.id_character = C.id_character
                               AND C.id_play = P.id_play
                               AND P.id_play = '{session["id_play"]}'"""
    cdtls = get_credentials_db()
    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        cur.execute(sqlGetStudents)
        students = cur.fetchall()
        print(students)
        cur.close()
        connection.close()
        
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
    return 'it works!'