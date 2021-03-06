from __main__ import app
from app import session, redirect, cx_Oracle, render_template, get_credentials_db,request

@app.route('/attendance', methods=['GET'])
def attendance():
    if not session.get("email"):
        return redirect("/loginTeacher")
    
    # Get play's students
    sqlGetStudents = f"""SELECT S.student_code, student_names||' '||student_surnames,email_address2, U.uni_name
                         FROM student S, character_student CS, character C, play P, unit U
                         WHERE S.unit_code LIKE U.unit_code
                           AND S.student_code = CS.student_code
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
        
        cur.close()
        connection.close()
        
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
    return render_template('attendance.html', students=students)
  
def check_attendance(codigo):
    _codigo = codigo
    print(_codigo)
    # Attentdance verify code student
    sqlGetAttendance = f"""SELECT ea.id_student_attendance
                           FROM student_attendance ea, student s
                           WHERE s.student_code = '{_codigo}'
                            AND ea.student_code = '{_codigo}'
                            AND ea.id_function = '{session["id_function"]}'"""
    cdtls = get_credentials_db()
    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        cur.execute(sqlGetAttendance)
        std_attendance = cur.fetchall()
        cur.close()
        connection.close()
        # returning true or false
        if len(std_attendance)>0:
            return True
        else:
            return False
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
    return False
# mark all attendance
@app.route('/markAttendance', methods=['POST'])
def mark_attendance():
    _id_play = request.form['idPlay']
    _id_function = request.form['idFunction']
    # Get play's students
    sqlGetCodeStudents = f"""SELECT S.student_code
                         FROM student S, character_student CS, character C, play P, unit U
                         WHERE S.unit_code like U.unit_code
                           AND S.student_code = CS.student_code
                           AND CS.id_character = C.id_character
                           AND C.id_play = P.id_play
                           AND P.id_play like '{_id_play}'
    """
    cdtls = get_credentials_db()
    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        cur.execute(sqlGetCodeStudents)
        codes = cur.fetchall()
        cur.close()
        connection.close()
        # for to check all attendance (verifying if it's attended or not)
        for i in range (len(codes)):
            if (check_attendance(codes[i][0]) == False):
                mark_all_attendance(codes[i][0],_id_function,_id_play)
        
        return redirect("/attendance")
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
    return redirect("/attendance")
    
# method to mark one by one attendance 
def mark_all_attendance(code,id_function,id_play):
    # Insert student attendance
    sqlInsAttendance = f"""INSERT INTO student_attendance (student_code, id_play, id_function) 
                           VALUES ('{code}', '{id_play}', '{id_function}')"""

    cdtls = get_credentials_db()

    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        cur.execute(sqlInsAttendance)
        connection.commit()  
        cur.close()
        connection.close()
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
# map to mark individual attendance
@app.route('/markIndAtt', methods=['POST','GET'])
def student_attendance():
    if not session.get("email"):
        return redirect("/loginTeacher")

    _student_code = request.form['codeStudent']
    _id_play = session['id_play']
    _id_function = session['id_function']
    print(_id_function)

    # Insert student attendance
    sqlInsAttendance = f"""INSERT INTO student_attendance (student_code, id_play, id_function) 
                           VALUES ('{_student_code}', '{_id_play}', '{_id_function}')"""

    cdtls = get_credentials_db()

    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        cur.execute(sqlInsAttendance)
        connection.commit()  
        cur.close()
        connection.close()
        return redirect("/attendance")
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
    return redirect("/attendance")
# function to use with jinja on template
app.jinja_env.globals.update(check_attendance=check_attendance)