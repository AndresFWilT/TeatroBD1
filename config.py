import os

class Config(object):
    SECRET_KEY = 'my_secret_key'
    ## CONFIG FOR MAIL SERVER

    MAIL_SERVER = 'smtp.gmail.com'
    MAIL_PORT = 587
    MAIL_USE_SSL = False
    MAIL_USE_TKS = True
    # MAIL conf
    MAIL_USERNAME = 'udTeatros@gmail.com'
    MAIL_PASSWORD = 'qwertyuiop_1234'
    #MAIL_PASSWORD = os.environ.get('PASSWORD_EMAIL_CF')