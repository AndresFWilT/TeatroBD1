# imports
from flask import Flask, escape, render_template, request
from flask_wtf import CSRFProtect
from flask_mail import Mail, Message
import forms
import cx_Oracle
import json

# Global
app = Flask(__name__)
mail = Mail()

# Conexion a la base de datos


@app.route('/con')
def connection():
    cdtls = getCredentialsDB()
    print(f"Credentials: {cdtls}")
    connection = cx_Oracle.connect(f'{cdtls["user"]}/{cdtls["psswrd"]}@{cdtls["host"]}:{cdtls["port"]}/{cdtls["db"]}')
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
    auditionForm = forms.AuditionForm()
    return render_template('addStudent.html', form = auditionForm)

# path para insertar persona estudiante audicion
@app.route('/succesStudent', methods=['GET', 'POST'])
def insertStudentfAudition():
    audition_form = forms.CreateForm(request.form)
    if request.method == 'POST' and audition_form.validate():
        print(audition_form.email.data)
        # email sending
        msg = Message('TeatrosUD: Agendacion audicion',
                      sender=app.config['MAIL_USERNAME'],
                      recipients=[audition_form.email.data])
    return render_template('successIns.html')

# path vista ver estudiante


@app.route('/viewStudent')
def viewStudent():
    return render_template('viewStudent.html')
# path vista ver audicion


@app.route('/viewAudition')
def viewAudition():
    return render_template('viewAudition.html')

# Obetener credenciales
def getCredentialsDB():
    #Opening JSON file
    f = open('credentials.json')
    #returns JSON object as a dictionary 
    db = json.load(f)
    f.close
    return db

if __name__ == '__main__':
    app.run(debug=True)
    
