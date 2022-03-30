# SISGETUD
## _Sistema de gestion de teatros de la Universidad Distrital_
### Creadores
Andres Felipe Wilches Torres
Cristian Felipe Ovalles Ramirez
Josue Alexander Nuñez Prada

Este es un proyecto aprendizaje desarrollado durante la materia de Bases de datos I, con el se pretende gestionar los teatros, las funciones, los gastos y tener un control sobre las actividades que realizan todas las personas con vinculo con los teatros de la universidad.

## Tecnologias utilizadas

- Flask (framework de desarrollo web con Python)
- Bootstrap (framework de frontend)
- Oracle Database (21c Express Edition)

## Instalación

Para ejecutar el programa se debe tener instalado python, ademas de ciertas librerias instaladas, antes de instalarlas es recomentable crear un ambiente virtual de python en donde se almacenaran las librerias necesarias para ejecutar el programa. Las siguentes son las instrucciones para el sistema operativo Windows.

Para crear el ambiente virtual 
```sh
python -m venv nombreDelEntorno
```
Para activar el entorno virtual entramos al propmt

```sh
nombreDelEntorno\Scripts\activate
```

Una vez activado el entorno virtual, hacemos las instalaciones.
Para instalar las librerias con sus dependencias usamos el archivo requirements
```sh
pip install -r requirements.txt
```
Para ejecutar el servidor ejecutamos el archivo app.py
```sh
python app.py
```
### Base de datos
Para crear la base de datos, en la carpeta llamada scripts-db se encuentra el scrip llamado creation_db. Para ejecutarlo desde la consola que nos ofrece oracle usamos:
```sh
start (unicacion del archivo)/creation_db
```
El aplicativo usa un metodo para obtener las credenciales de acceso a la base de datos. Este metodo lee un archivo JSON con dichas credenciales. Es necesario crear este archivo (credentials.json) y escribir las credenciales como en el siguiente ejemplo:
```sh
{
  "user": "utud",
  "psswrd": "1234",
  "host": "localhost",
  "port": "1521",
  "db": "tud"
}
```
