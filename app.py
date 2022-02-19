## imports
from flask import Flask, escape,render_template, request
from flask_wtf import CSRFProtect
from flask_mail import Mail,Message
import forms, config


##  Global
app = Flask(__name__)
mail = Mail()

#path inicio
@app.route('/')
def init():
    mail.init_app(app)
    return index()

@app.route('/index')
def index():
    return render_template('index.html')

#path vista agregar estudiante
@app.route('/addStudent')
def addStudent():
    auditionForm = forms.AuditionForm()
    return render_template('addStudent.html', form = auditionForm)

#path para insertar persona estudiante audicion
@app.route('/successStudent',methods=['GET','POST'])
def insertStudentfAudition():
    print('prueba '+request.form['email'])
    audition_form = forms.AuditionForm(request.form)
    if request.method == 'POST' and audition_form.validate():
        print('Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        print('correo registrado: '+audition_form.email.data)
        ## email sending
        msg = Message('TeatrosUD: Agendacion audicion',
        sender = app.config['MAIL_USERNAME'],
        recipients=[audition_form.email.data])

    return render_template('successIns.html')

#path vista ver estudiante
@app.route('/viewStudent')
def viewStudent():
    return render_template('viewStudent.html')
#path vista ver audicion
@app.route('/viewAudition')
def viewAudition():
    return render_template('viewAudition.html')