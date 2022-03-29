# imports
from flask import Flask, render_template, request, session, redirect
from flask_mail import Mail, Message
from flask_session import Session
from config import DevelopmentConfig
from flask_bootstrap import Bootstrap
import cx_Oracle
import json
app = Flask(__name__)
import travel_expenses, attendance

# Global
mail = Mail()
bootstrap = Bootstrap(app)


## path for dataBase test connection
@app.route('/con')
def connection():
    #   getting credentials from the method get_credentials_db
    cdtls = get_credentials_db()
    print(f"Credentials: {cdtls}")
    #   making connection from impor cx_oracle, and passing the parameters into the dicctionary for conecction
    connection = cx_Oracle.connect(
        f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
    )
    # making the cursor
    cur = connection.cursor()
    #   probing connection
    cur.execute("SELECT 'Hello, World from Oracle DB!' FROM DUAL")

    col = cur.fetchone()[0]
    cur.close()
    connection.close()
    return col


##  default server path
@app.route('/')
def init():
    return index()


##  path for index
@app.route('/index')
def index():
    return render_template('index.html')


## path for view addStudent
@app.route('/addStudent')
def add_student():
    return render_template('addStudent.html')


## path for log out
@app.route('/logout')
def logout():
    session["email"] = None
    return index()


## path to insert student audition
@app.route('/saveStudent', methods=['POST'])
def insert_student_audition():
    if request.method == 'POST':
        #   from post we request the inputs from the view
        _names = request.form['names']
        _surname = request.form['surnames']
        _career = request.form['career']
        _email = request.form['emailAddress']
        _idnumber = int(request.form['IDNumber'])
        _idtype = request.form['IDType']
        _code = int(request.form['codeStudent'])
        _birth = request.form['birthDate']
        # we replace the - for /, for oracle db input
        _birth = _birth.replace('-', '/')
        _idplay = 1
        #   query for insert into person, format variable
        sqlInsPerson = f"""INSERT INTO person (idnumber, names, surname, idtype, email, birth)
                            VALUES ('{_idnumber}', '{_names}', '{_surname}', 
                            '{_idtype}', '{_email}', to_date('{_birth}','YYYY/MM/DD'))"""
        #   query for insert into student, format variable
        sqlInsStudent = f"""INSERT INTO student VALUES ('{_code}', '{_idnumber}', '{_career}')"""

        sqlGetOccupedDate = f"""SELECT dateaudition FROM audition 
                            WHERE idaudition=(SELECT max(idaudition) FROM audition)"""
        #   we bring the credentials from the database
        cdtls = get_credentials_db()
        #   try catch, if it's an error with the query or sending email mssg
        try:
            #   connection
            connection = cx_Oracle.connect(
                f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
            )
            cur = connection.cursor()
            #   execute querys
            cur.execute(sqlInsPerson)
            cur.execute(sqlInsStudent)
            cur.execute(sqlGetOccupedDate)
            #   fetching occuped date
            occupedDate = cur.fetchone()[0]
            #
            newDate = assign_date(occupedDate)
            sqlInsAudition = f"""INSERT INTO audition (idnumber, code, idplay, dateaudition) 
                                VALUES ('{_idnumber}','{_code}', '{_idplay}', timestamp '{newDate}')"""
            cur.execute(sqlInsAudition)
            #   email sending
            print("Sending mail")
            #   message (title, sender, remitent)
            msg = Message('TeatrosUD: Agendacion audicion',
                          sender=app.config['MAIL_USERNAME'],
                          recipients=[_email])
            #   html body message
            msg.html = render_template(
                'emailMessage.html', **{
                    'names': _names,
                    'surnames': _surname,
                    'day': newDate.day,
                    'month': newDate.month,
                    'year': newDate.year,
                    'hour': newDate.hour,
                    'minute': newDate.minute
                })
            #   sending email
            mail.send(msg)
            #   making commit for connection
            connection.commit()
            #   closing cursor
            cur.close()
            #   closing connection
            connection.close()
            #   succesfull message
            message = "Registro completado exitosamente"
        except cx_Oracle.Error as error:
            print('Error occurred:')
            print(error)
            #   error message for view
            message = "Lo sentimos no pudimos agendar la audicion. Error en el registro"
        return render_template('resultInsertion.html', message=message)


##  path for view student
@app.route('/viewStudent')
def view_student():
    #   getting all the students with a query
    sqlGetStudents = """SELECT S.code, CONCAT(CONCAT(P.idtype, ' '), P.idnumber), CONCAT(CONCAT(P.names, ' '), P.surname), P.email , S.career FROM person P, student S WHERE P.idnumber = S.idnumber """
    #   gettin credentials from method
    cdtls = get_credentials_db()
    #   try catch
    try:
        #   connection
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        #   executing query
        cur.execute(sqlGetStudents)
        #   fetch to show students
        all_students = cur.fetchall()
        #   closing cursor & connection
        cur.close()
        connection.close()
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
        all_students = False
    return render_template('viewStudent.html', all_students=all_students)


##  path to view audition
@app.route('/viewAudition')
def view_audition():
    #   Getting the auditions from audition by order date desc
    sqlGetAuditions = """SELECT PE.names, PL.title, A.code, A.dateaudition
                        FROM person PE, play PL, audition A, student S
                        WHERE PE.idnumber = S.idnumber and S.code = A.code and A.idplay = PL.idplay ORDER BY A.dateaudition DESC"""
    #   Getting credentials from method
    cdtls = get_credentials_db()
    #   try catch for errors
    try:
        #   connection
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        #   executing query
        cur.execute(sqlGetAuditions)
        #   fetch for all audition
        all_auditions = cur.fetchall()
        #   closing connection
        cur.close()
        connection.close()
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
        all_auditions = False
    return render_template('viewAudition.html', all_auditions=all_auditions)


##  path to view login
@app.route('/loginTeacher')
def view_loginTeacher():
    return render_template("loginTeacher.html")


## Path to verify the credentials of the teacher
@app.route("/verifyTeacher", methods=['POST'])
def loginTeacher():
    if request.method == 'POST':
        # From POST method, we request the inputs from the view
        _email = request.form['emailAddress']
        _password = request.form['password']
        try:
            # Query for the password for the DB
            sqlGetPass = f"""SELECT em.identification_number 
                             FROM EMPLOYEE em WHERE em.email_address like '%{_email}%'"""
            # Query for bring the data of the user
            sqlGetEmployee = f"""SELECT em.names, em.surnames, em.email_address, 
                                        to_char(SYSDATE,'DD/MM/YYYY HH24:MI'), em.employee_code
                                 FROM EMPLOYEE em, DUAL WHERE em.email_address like '%{_email}%'"""
            
            
            # Bring the credentials from JSON to use in DB
            cdtls = get_credentials_db()
            try:
                # Connection
                connection = cx_Oracle.connect(
                    f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
                )
                cur = connection.cursor()
                # Execute Querys
                cur.execute(sqlGetPass)                
                # fetch to get password
                fetch = cur.fetchall()[0]
                password = fetch[0]
                # executing Query for user
                cur.execute(sqlGetEmployee)
                employee = cur.fetchall()
                # Query for get active play
                sqlGetPlay = f"""SELECT P.title
                                 FROM play P, stage_play_staff STS, Employee E
                                 WHERE P.id_play = STS.id_play
                                    AND STS.employee_code = E.employee_code
                                    AND STS.unit_code = E.unit_code
                                    AND P.state = 1
                                    AND E.employee_code = 'SNOD'"""
                cur.execute(sqlGetPlay)
                play = cur.fetchall()
                # closing cursor
                cur.close()
                # closing connection
                connection.close()
                if str(password) == str(_password):
                    button_attendance = verify_button_attendance(employee[0][3])
                    button_tra_exp = verify_button_tra_exp(employee[0][3])
                    button_certificates = verify_play_state()
                    session["email"] = _email
                    if len(play)>0:
                        play = play[0][0]
                    else:
                        play = ""
                    employee = {
                      "employee_data": employee[0],
                      "attendance": button_attendance,
                      "exp_tra": button_tra_exp,
                      "certi": button_certificates,
                      "title": play
                    }
                    # succesfull message
                    return render_template('homeTeacher.html', employee=employee)
                else:
                    message = "Datos no coinciden"
            except cx_Oracle.Error as error:
                print('Error occurred: in verify teacher')
                print(error)
                #   error message for view
                message = "No pudimos hacer su solicitud"
        except Exception as e:
            message = e
        return render_template('loginTeacher.html', message=message)


# Getting credentials
def get_credentials_db():
    # Opening JSON file
    f = open('credentials.json')
    # returns JSON object as a dictionary
    db = json.load(f)
    f.close
    return db


##  Asign date
def assign_date(occupedDate):
    if occupedDate.hour >= 18:
        occupedDate = occupedDate.replace(hour=6)
        if occupedDate.weekday() >= 5:
            occupedDate = occupedDate.replace(day=occupedDate.day + 2)
        else:
            occupedDate = occupedDate.replace(day=occupedDate.day + 1)
    newDate = occupedDate.replace(hour=occupedDate.hour + 2, minute=0)
    return newDate


# Check availability of attendance button
def verify_button_attendance(date):
    #date = '25/03/2022 09:00'
    sqlGetFunction = f"""SELECT id_play, id_function
                         FROM function
                         WHERE function_date = to_date('{date[:10]}', 'DD/MM/YYYY')
                           AND start_time <= (to_date('{date}', 'DD/MM/YYYY HH24:MI'))
                           AND end_time >= (to_date('{date}', 'DD/MM/YYYY HH24:MI'))"""
    cdtls = get_credentials_db()
    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        cur.execute(sqlGetFunction)
        function = cur.fetchall()
        cur.close()
        connection.close()
        if len(function) > 0:
            session["id_play"] = function[0][0]
            session["id_function"] = function[0][1]
            return True
    except cx_Oracle.Error as error:
        print('Error occurred: in verify button attendance')
        print(error)
    return False


# Check availability of travel expenses button
def verify_button_tra_exp(date):
    _id_play = session["id_play"]
    sqlGetFunction = f"""SELECT id_function
                         FROM function
                         WHERE function_date = (SELECT max(function_date)
                                                FROM function
                                                WHERE id_play = '{_id_play}')
                           AND id_play = '{_id_play}'
                           AND function_date < to_date('{date[:10]}', 'DD/MM/YYYY')"""
    cdtls = get_credentials_db()
    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        cur.execute(sqlGetFunction)
        function = cur.fetchall()
        cur.close()
        connection.close()
        if len(function) > 0:
            return True
    except cx_Oracle.Error as error:
        print('Error occurred: in verify tra exp button')
        print(error)
    return False


def verify_play_state():
    sqlGetPlay = f"""SELECT id_play
                     FROM play
                     WHERE state = 1"""
    cdtls = get_credentials_db()
    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        cur.execute(sqlGetPlay)
        play = cur.fetchall()
        cur.close()
        connection.close()
        if len(play) > 0:
            return True
    except cx_Oracle.Error as error:
        print('Error occurred: in verify play state' )
        print(error)
    return False

if __name__ == '__main__':
    mail.init_app(app)
    app.config.from_object(DevelopmentConfig)
    app.config["SESSION_PERMANENT"] = False
    app.config["SESSION_TYPE"] = "filesystem"
    Session(app)
    app.run(debug=True)


