# imports
import re
from unicodedata import name
from flask import Flask, escape, render_template, request
from flask_wtf import CSRFProtect
from flask_mail import Mail, Message
import forms
import cx_Oracle
import json
import os

# Global
app = Flask(__name__)
mail = Mail()

# Conexion a la base de datos


@app.route('/con')
def connection():
    cdtls = getCredentialsDB()
    print(f"Credentials: {cdtls}")
    connection = cx_Oracle.connect(
        f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}')
    cur = connection.cursor()
    cur.execute("SELECT 'Hello, World from Oracle DB!' FROM DUAL")
    col = cur.fetchone()[0]
    cur.close()
    connection.close()
    return col

# path inicio


@app.route('/')
def init():
    mail.init_app(app)
    return index()


@app.route('/index')
def index():
    return render_template('index.html')

# path vista agregar estudiante


@app.route('/addStudent')
def addStudent():
    return render_template('addStudent.html')

# path para insertar persona estudiante audicion


@app.route('/saveStudent', methods=['POST'])
def insertStudentAudition():
    if request.method == 'POST':
        
        _names = request.form['names']
        _surname = request.form['surnames']
        _career = request.form['career']
        _email = request.form['emailAddress']
        _idnumber = int(request.form['IDNumber'])
        _idtype = request.form['IDType']
        _code = int(request.form['codeStudent'])
        _birth = request.form['birthDate']  
        _birth = _birth.replace('-', '/')
        _idplay = 1    

        sqlInsPerson = f"""INSERT INTO person (idnumber, names, surname, idtype, email, birth)
                            VALUES ('{_idnumber}', '{_names}', '{_surname}', 
                            '{_idtype}', '{_email}', to_date('{_birth}','YYYY/MM/DD'))"""
    
        sqlInsStudent = f"""INSERT INTO student VALUES ('{_code}', '{_idnumber}', '{_career}')"""

        sqlGetOccupedDate = f"""SELECT dateaudition FROM audition 
                            WHERE idaudition=(SELECT max(idaudition) FROM audition)"""

        cdtls = getCredentialsDB()
        try:
            connection = cx_Oracle.connect(
                f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}')
            cur = connection.cursor()
            cur.execute(sqlInsPerson)
            cur.execute(sqlInsStudent)
            cur.execute(sqlGetOccupedDate)
            occupedDate = cur.fetchone()[0]
            newDate = assignDate(occupedDate)
            sqlInsAudition = f"""INSERT INTO audition (code, idplay, dateaudition) 
                                VALUES ('{_code}', '{_idplay}', timestamp '{newDate}')"""
            cur.execute(sqlInsAudition)
            ''' cur.execute("select * from person")
            res = cur.fetchall()
            for row in res:
                print(row) '''
            connection.commit()
            cur.close()
            connection.close()
            # email sending
            print("Sending mail")
            ''' msg = Message('TeatrosUD: Agendacion audicion',
                        sender=app.config['MAIL_USERNAME'],
                        recipients=[audition_form.email.data]) '''
            message = "Registro completado exitosamente"
        except cx_Oracle.Error as error:
            print('Error occurred:')
            print(error)
            message = "Lo sentimos no pudimos agendar la audicion. Error en el registro"
        return render_template('successInsertion.html', message=message)
        

@app.route('/viewStudent')
def viewStudent():
    return render_template('viewStudent.html')
# path vista ver audicion


@app.route('/viewAudition')
def viewAudition():
    return render_template('viewAudition.html')

# Logic for assign new date of audition
def assignDate(occupedDate):
    if occupedDate.hour >= 18:
        occupedDate = occupedDate.replace(hour=6)
        if occupedDate.weekday() >= 5:
            occupedDate = occupedDate.replace(day=occupedDate.day + 2)
        else:
            occupedDate = occupedDate.replace(day=occupedDate.day + 1)
    newDate = occupedDate.replace(hour=occupedDate.hour + 2, minute=0)
    return newDate

# Obetener credenciales

def getCredentialsDB():
    # Opening JSON file
    f = open('credentials.json')
    # returns JSON object as a dictionary
    db = json.load(f)
    f.close
    return db


if __name__ == '__main__':
    app.run(debug=True)
    assert os.path.exists('.env')  # for other environment variables...
    # HARD CODE since default is production
    os.environ['FLASK_ENV'] = 'development'
    app.run(debug=True)
