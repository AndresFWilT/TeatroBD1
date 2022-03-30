# imports
from flask import Flask, render_template, request, session, redirect
from flask_mail import Mail, Message
from flask_session import Session
from config import DevelopmentConfig
from flask_bootstrap import Bootstrap
from jinja2 import Environment, FileSystemLoader
from weasyprint import HTML, CSS
import os
import cx_Oracle
import json
app = Flask(__name__)
import attendance

# Global
mail = Mail()
bootstrap = Bootstrap(app)
students = []

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
    sendMail()
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
                                    AND E.employee_code = '{employee[0][4]}'"""
                cur.execute(sqlGetPlay)
                play = cur.fetchall()
                # closing cursor
                cur.close()
                # closing connection
                connection.close()
                if str(password) == str(_password):
                    
                    button_attendance = verify_button_attendance(employee[0][3])
                    button_tra_exp = verify_button_tra_exp(employee[0][3])
                    button_certificates = verify_play_state(employee[0][3])
                    session["email"] = _email
                    if len(play)>0:
                        play = play[0][0]
                        session["title"] = play
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
    date = '29/03/2022 09:00'
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
    date = '07/05/2022 09:00'
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

def verify_play_state(date):
    date = '07/05/2022'
    sqlGetPlay = f"""SELECT DISTINCT P.id_play
                     FROM play P, function F
                     WHERE state = 1
                       AND F.id_play = P.id_play
                       AND to_date('{date}', 'DD/MM/YYYY') > (SELECT max(function_date)
                                                              FROM function
                                                              WHERE id_play = '{session["id_play"]}')"""
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

    
## Map to get the table of travel expenses
@app.route('/tExpenses', methods=['GET'])
def table_travel_expenses():
    # check if the user is logged or not
    if not session.get("email"):
        # if not there in the session then redirect to the login page
        return redirect("/loginTeacher")
    # Query for table Expenses
    sqlTableExpenses = f"""select distinct                                    
                                   s.student_names || ' ' ||
                                   s.student_surnames,
                                   s.student_code,
                                   COUNT(sa.student_code),
                                   SUM(to_char(f.END_TIME,'HH24') - to_char(f.START_TIME,'HH24'))
                            from Play pl,
                                 Student s,
                                 Character c,
                                 character_student cs,
                                 unit u,
                                 function f,
                                 Student_Attendance sa,
                                 expend_play EP,
                                 term T
                            where pl.id_play = c.id_play
                                   and c.id_character = cs.id_character
                                   and c.id_play = cs.id_play
                                   and cs.student_code = s.student_code       
                                   and s.unit_code = u.unit_code
                                   and pl.id_play = '{session["id_play"]}'
                                   and f.id_play=sa.id_play
                                   and f.id_function=sa.id_function
                                   and sa.student_code=s.student_code
                                   AND EP.id_term = T.id_term
                                   AND EP.id_play = pl.id_play
                            group by s.student_names||' '||
                                   s.student_surnames,
                                   s.student_code
                                   """

    cdtls = get_credentials_db()
    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        cur.execute(sqlTableExpenses)
        students = cur.fetchall()    
        cur.close()
        connection.close()
        
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
    return render_template('settlement.html', students=students)

# Map to make the liquidation and generation PDF for travel expenses
@app.route('/TEGeneratePDF', methods=['POST'])
def liquidation_expenses():
     # check if the user is logged or not
    if not session.get("email"):
        # if not there in the session then redirect to the login page
        return redirect("/loginTeacher")
    sqlGetPlay = f"""select e.names || ' ' ||
                            e.surnames,
                            e.identification_number,
                            DU.uni_name
                     from employee e,
                          Unit u,
                          unit DU
                     where e.unit_code = u.unit_code
                            AND e.email_address = '{session["email"]}'
                            AND u.dependency_unit = DU.unit_code"""
    sqlGetDates = f"""SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY'), TO_CHAR(min(F.function_date), 'DD/MM/YYYY'), 
                             TO_CHAR(max(function_date), 'DD/MM/YYYY'), P.title
                      FROM function F, play P
                      WHERE F.id_play = '{session["id_play"]}'
                        AND F.id_play = P.id_play
                      GROUP BY P.title"""
    sqlGetStudents = f"""select distinct                                    
                            s.student_names || ' ' ||
                            s.student_surnames,
                            s.student_code,
                            s.email_address2,
                            COUNT(sa.student_code),
                            SUM(to_char(f.END_TIME,'HH24') - to_char(f.START_TIME,'HH24')),
                            T.term_desc
                         from Play pl,
                            Student s,
                            Character c,
                            character_student cs,
                            unit u,
                            function f,
                            Student_Attendance sa,
                            expend_play EP,
                            term T
                         where pl.id_play = c.id_play
                            and c.id_character = cs.id_character
                            and c.id_play = cs.id_play
                            and cs.student_code = s.student_code       
                            and s.unit_code = u.unit_code
                            and pl.id_play = 'RADJ'
                            and f.id_play=sa.id_play
                            and f.id_function=sa.id_function
                            and sa.student_code=s.student_code
                            AND EP.id_term = T.id_term
                            AND EP.id_play = pl.id_play
                         group by s.student_names||' '||
                            s.student_surnames,
                            s.student_code,
                            T.term_desc,
                            s.email_address2"""
    cdtls = get_credentials_db()
    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        cur.execute(sqlGetPlay)
        teacher_data = cur.fetchall()
        cur.execute(sqlGetDates)
        dates_title = cur.fetchall()
        cur.execute(sqlGetStudents)
        students_info = cur.fetchall()
        print(students_info)
        cur.close()
        connection.close()
        
    except cx_Oracle.Error as error:
        print('Error occurred: in verify play state' )
        print(error)

    # information dicctionary for header, footer and part of the content of the PDF
    info = {
        "fecha": dates_title[0][0],
        "obra": dates_title[0][3],
        "fechaInicio": dates_title[0][1],
        "fechaFin": dates_title[0][2],
        "nombreProfesor": teacher_data[0][0],
        "cedula": teacher_data[0][1],
        "facultad": teacher_data[0][2],
        }

    # calls the function pdf_creation
    PDF_creation('C:/Proyectos/TeatroUdistrital/Flask/teatroudbd/templates/settlementTravelExpenses.html',
        info, 'expenses',students_info)
    return redirect('/tExpenses')

## Function to create a PDF
# directory of template, information, dependency, students info
def PDF_creation(template, information, dependency,students):
    # first we take the name of the template
    template_name = template.split('/')[-1]

    # use the environment loeader FilSystem for the directory templates
    env = Environment(loader=FileSystemLoader('templates'))
    play_name = information['obra'].replace(" ", "")

        # generating the paths
    saving_path = dependency + '/' + play_name
    print('El camino de guardado es: ' + saving_path)

    # select the name of the html file
    template = env.get_template(template_name)
    html = template.render(information=information,students=students)

    # then save into the dependency with the name of the file
    with open(saving_path + '.html', 'w') as f:
        f.write(html)

    # Style conf
    css = CSS(string='''
        @page {size: A4; margin: 1cm:}
        th, td {border: 1px solid black;}
    ''')

    # file convertion from html to PDF
    HTML(saving_path + '.html').write_pdf(saving_path + '.pdf',
                                              stylesheets=[css])

    # deleting the HTML
    if os.path.exists(saving_path + '.html'):
        os.remove(saving_path + '.html')

# Map to go to view, certificates
@app.route('/certificates', methods=['POST'])
def certificates():
    if not session.get("email"):
        return redirect("/loginTeacher")
    
    # Get play's of the teacher
    sqlGetPlays = f"""Select p.title
                        from  play p, Stage_Play_Staff sps, employee e
                        where p.id_play=sps.id_play
                        and sps.employee_code=e.employee_code
                        and sps.unit_code=e.unit_code
                        and e.email_address like '{session["email"]}'"""
    
    cdtls = get_credentials_db()
    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        cur.execute(sqlGetPlays)
        plays = cur.fetchall()
        cur.close()
        connection.close()
        
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
    return render_template('certificate.html', plays = plays)

# Map to search student plays, w student code
@app.route('/searchStudent', methods=['POST'])
def search_student():
    if not session.get("email"):
        return redirect("/loginTeacher")
    # code from POST
    _code = request.form["code"]

    # Get play's of student with ode
    sqlGetStudentPlays = f"""select p.title, s.student_code
                            from play p, Character c, character_student cs, student S
                            where p.id_play = c.id_play
                                and c.id_Character=cs.id_Character
                                and c.id_play=cs.id_play
                                and cs.student_code=s.student_code
                                and s.student_code = {_code}"""
    
    # Get play's of the teacher
    sqlGetPlays = f"""Select p.title
                        from  play p, Stage_Play_Staff sps, employee e
                        where p.id_play=sps.id_play
                        and sps.employee_code=e.employee_code
                        and sps.unit_code=e.unit_code
                        and e.email_address like '{session["email"]}'"""
    
    cdtls = get_credentials_db()
    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        # get the plays of student
        cur.execute(sqlGetStudentPlays)
        students = cur.fetchall()
        # get the plays of the teacher to recharge the page
        cur.execute(sqlGetPlays)
        plays = cur.fetchall()
        cur.close()
        connection.close()
        print(students)
        
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
    return render_template('certificate.html', plays = plays,students = students)

# Map to search student plays, w student code
@app.route('/generateIndCerti', methods=['POST'])
def certify_selected_student_play():
    if not session.get("email"):
        return redirect("/loginTeacher")

    # Play name selected from template
    _play_name = request.form["play_name"]
    
    # student code
    _code = request.form["code"]

    # Get play's of the teacher
    sqlGetPlays = f"""Select p.title
                        from  play p, Stage_Play_Staff sps, employee e
                        where p.id_play=sps.id_play
                        and sps.employee_code=e.employee_code
                        and sps.unit_code=e.unit_code
                        and e.email_address like '{session["email"]}'"""

    # Get play's of the teacher
    sqlGetInfo = f"""select p.title, 
                        s.student_names|| ' ' || s.student_surnames,
                        e.names || ' '|| e.surnames, 
                        t.term_desc, 
                        c.character_name, 
                        s.email_address2,
                        u.uni_name,
                        e.identification_number
                    from play p, 
                        employee e, 
                        term t, 
                        student s, 
                        Character c, 
                        character_student cs, 
                        Stage_Play_Staff sps, 
                        activity_list al,
                        work_play_staff wps,  
                        unit u     
                    where p.id_play = c.id_play
                        and c.id_Character=cs.id_Character
                        and c.id_play=cs.id_play
                        and cs.student_code=s.student_code
                        and s.student_code = '{_code}'
                        and p.title = '{_play_name}'
                        and sps.id_play=p.id_play
                        and e.unit_code=sps.unit_code
                        and e.employee_code=sps.employee_code
                        and wps.unit_code=sps.unit_code
                        and wps.employee_code=sps.employee_code
                        and wps.id_sta_pla_staff=sps.id_sta_pla_staff
                        and wps.activity_code = 'DRTR1'
                        and al.id_term=wps.id_term
                        and al.activity_code=wps.activity_code
                        and t.id_term=al.id_term
                        and s.unit_code=u.unit_code
                """
    
    cdtls = get_credentials_db()
    try:
        connection = cx_Oracle.connect(
            f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}'
        )
        cur = connection.cursor()
        # get the plays of student
        cur.execute(sqlGetInfo)
        info = cur.fetchall()

        # get the plays of teacher
        cur.execute(sqlGetPlays)
        plays = cur.fetchall()
        
        _email_destination = info[0][5]

        information = {
            "director": info[0][2],
            "nombre": info[0][1],
            "codigo": _code,
            "obra": info[0][0],
            "periodo": info[0][3],
            "personaje": info[0][4],
            "cedula": info[0][7],
            "facultad": info[0][6],
        }

        students = [()]

        PDF_creation('C:/Proyectos/TeatroUdistrital/Flask/teatroudbd/templates/certificationStudent.html',
        information, 'certification',students)

        sendMail(_email_destination,'TeatrosUD: certificacion participacion en obra',information,'certification')

        cur.close()
        connection.close()
        message = "correo electronico enviado"
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
        message = "se envio el correo"

    return render_template('certificate.html', plays = plays,message = message)

# sending a mail for certification
def sendMail(destination,header,information,dependency):

    # use the environment loeader FilSystem for the directory templates
    play_name = information['obra'].replace(" ", "")

    # generating the paths
    saving_path = dependency + '/' + play_name

    msg = Message(header,
                          sender=app.config['MAIL_USERNAME'],
                          recipients=[destination])

    #   html body message
    msg.html = render_template(
            'emailCertificationMessage.html', **{
                'director': information['director'],
                'nombre': information['nombre'],
                'obra': information['obra'],
                }
            )

    #   sending email
    with app.open_resource(saving_path+".pdf") as fp:  
        msg.attach(saving_path+".pdf", "application/pdf", fp.read())  
    mail.send(msg)


if __name__ == '__main__':
    app.config.from_object(DevelopmentConfig)
    app.config["SESSION_PERMANENT"] = False
    app.config["SESSION_TYPE"] = "filesystem"
    Session(app)
    mail.init_app(app)
    app.run(debug=True)
    
