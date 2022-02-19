from wtforms import Form, StringField, IntegerField, EmailField, DateTimeField

## Form from student audition to actor
class AuditionForm(Form):
    #global var
    names = StringField('name')
    surname = StringField('lastName')
    career = StringField('career')
    email = EmailField('emailAddress')
    idNumber = IntegerField('IDNumber')
    idType = StringField('IDType')
    code = IntegerField('codeStudent')
    birth = DateTimeField('birthDate')