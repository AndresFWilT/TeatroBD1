from jinja2 import Environment,FileSystemLoader
from weasyprint import HTML, CSS
import os

class create_PDF:
    
    def __init__(self,_template,_information,_dependency):
        self.template = _template
        self.information = _information
        self.dependency = _dependency

    ## Function to create a PDF
    def creation(self):
        # first we take the name of the template
        template_name = self.template.split('/')[-1]
        
        # we give to the OS the dll directory of GTK3 for weasyprint (only or Win)
        os.add_dll_directory(r"C:/Program Files/GTK3-Runtime Win64/bin")

        # use the environment loeader FilSystem for the directory templates
        env = Environment(loader=FileSystemLoader('templates'))
        nombre_obra = self.information['obra'].replace(" ","")

        # generating the paths
        saving_path = self.dependency+'/'+nombre_obra
        print('El camino de guardado es: '+saving_path)

        # select the name of the html file
        template = env.get_template(template_name)
        html = template.render(info)

        # then save into the dependency with the name of the file
        with open(saving_path+'.html','w') as f:
            f.write(html)

        # Style conf
        css = CSS(string='''
            @page {size: A4; margin: 1cm:}
            th, td {border: 1px solid black;}
        ''')

        # file convertion from html to PDF
        HTML(saving_path+'.html').write_pdf(saving_path+'.pdf',stylesheets=[css])

        # deleting the HTML
        if os.path.exists(saving_path+'.html'):
            os.remove(saving_path+'.html')

info = {"fecha":"28/03/2022",
                "obra":"Chespirito es un mkon",
                "fechaInicio":"24/03/2022",
                "fechaFin":"27/03/2022",
                "estudiantes":"Josuelias Martinez hdez 202020202020 20172020",
                "nombreProfesor":"Soni ordo",
                "cedula":"1010101010",
                "facultad":"la poderosa ing. sis"}

x = create_PDF('C:/proyectos/TeatroUdistrital/Flask/teatroudbd/templates/settlementTravelExpenses.html',info,'expenses')
x.creation()