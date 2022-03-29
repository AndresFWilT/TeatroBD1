from app import get_app
from jinja2 import Environment, FileSystemLoader
from weasyprint import HTML, CSS
import os

class create_PDF:

    ## construct, template directory, basic info dicctionary, dependency to apply and students matrix
    def __init__(self, _template, _information, _dependency, _students):
        self.template = _template
        self.information = _information
        self.dependency = _dependency
        self.students = _students

    ## Function to create a PDF
    def creation(self):
        # first we take the name of the template
        template_name = self.template.split('/')[-1]

        # use the environment loeader FilSystem for the directory templates
        env = Environment(loader=FileSystemLoader('templates'))
        nombre_obra = self.information['obra'].replace(" ", "")

        # generating the paths
        saving_path = self.dependency + '/' + nombre_obra
        print('El camino de guardado es: ' + saving_path)

        # select the name of the html file
        template = env.get_template(template_name)
        html = template.render(info)

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
    
    def get_students_matrix(self):
        return self.students   

    get_app().jinja_env.globals.update(get_students_matrix=get_students_matrix)


info = {
    "fecha": "28/03/2022",
    "obra": "Chespirito el chompirans",
    "fechaInicio": "24/03/2022",
    "fechaFin": "27/03/2022",
    "nombreProfesor": "Sonia ordones",
    "cedula": "1010101010",
    "facultad": "la poderosa ing. sis",
}

nombre_est = ["Andres Wilches","Cristian Ovayes"]
correo_est = ["andres@correo.com","cristian@correo.com"]
codigo_est = [20172020114,20172020068]
cantidad_func = [3,2]
horas_part = [25,15]
periodo_tiempo = [20,16]

estudiantes = [nombre_est,
                codigo_est,
                correo_est,
                cantidad_func,
                horas_part,
                periodo_tiempo
]

x = create_PDF(
    'C:/proyectos/TeatroUdistrital/Flask/teatroudbd/templates/settlementTravelExpenses.html',
    info, 'expenses',estudiantes)
x.creation()

