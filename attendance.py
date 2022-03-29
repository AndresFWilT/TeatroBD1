from __main__ import app
from ctypes import sizeof
from app import session, redirect, cx_Oracle, render_template, get_credentials_db,request

@app.route('/attendance', methods=['GET'])
def attendance():
    if not session.get("email"):
        return redirect("/loginTeacher")
    
    # Get play's students
    sqlGetStudents = f"""SELECT S.student_code, student_names||' '||student_surnames,email_address2, U.uni_name
                         FROM student S, character_student CS, character C, play P, unit U
                         WHERE S.unit_code like U.unit_code
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
        
        # agregation of the tuple false
        for i in range(0,len(students)):
            students[i] = students[i] + tuple('f')
        
        cur.close()
        connection.close()
        
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
    return render_template('attendance.html', students=students)
  

@app.route('/markAttendance')
def mark_attendance():    
    pass
    
@app.route('/markIndAtt', methods=['POST','GET'])
def student_attendance():
    if not session.get("email"):
        return redirect("/loginTeacher")

    _student_code = request.form['codeStudent']
    _id_play = session['id_play']
    _id_function = session['id_function']

    _students = request.form['fields']
    _students = _students.replace("[","")
    _students = _students.replace("]","")

    counter = 0
    for i in range(0,len(_students)):
        if _students[i] == ')':
            counter = counter + 1
    
    tup = []

    ctr = 0
    for i in range(0,counter):
        chain = ''
        for j in range(ctr,len(_students)):
            chain = chain+_students[j]
            ctr = ctr + 1
            if _students[j] == ')':
                ctr = ctr + 2
                tup.append(chain)
                break

    for i in range(0,counter):
        tup[i] = tup[i].replace("(","")
        tup[i] = tup[i].replace(")","")

    for i in range(0,counter):
        print(str(_student_code) in tup[i])
        if str(_student_code) in tup[i]:
            print(tup[i])
            tup[i] = tup[i].replace(" 'f'"," 't'")
            print(tup[i])

    for i in range(0,counter):
        tup[i] = tup[i].replace("'","")

    for i in range(0,counter):
        tup[i] = tuple(map(str, tup[i].split(', ')))
    
    for i in range(0,counter):
        print(tup[i])

    students = tup

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


        return render_template('attendance.html', students=students)
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
    return render_template('attendance.html')