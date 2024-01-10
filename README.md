# movie_app

Desarrollo de una aplicación para cinéfilos y aficionados al cine. Esta primera versión (MVP) de la
aplicación consta con las siguientes funcionalidades:
1. Lista de peliculas en cartelera
2. Lista de peliculas mas votadas
3. lista de proximas peliculas 

La aplicación funciona con contenido de The Movie Database (TMDb). cuenta con un manejador de estado Bloc, con una base de datos local
(Isar) la cual nos permite guardar datos en el local Storage del dispositivo, para integrar la funcionalidad de peliculas favoritas, la aplicacion cuenta con un diseño unico,
amigable con el usuario teniendo la funcionalidad de eligir entre sus preferencias el tema Light o Dark.


## Images de la aplicacion en tema Dark
[![Captura-de-pantalla-2024-01-10-a-las-8-18-21.png](https://i.postimg.cc/xTqmSnN6/Captura-de-pantalla-2024-01-10-a-las-8-18-21.png)][![Captura-de-pantalla-2024-01-10-a-las-8-18-57.png](https://i.postimg.cc/dQ8K5y0F/Captura-de-pantalla-2024-01-10-a-las-8-18-57.png)](https://postimg.cc/bdNMJdbV) 


[![Captura-de-pantalla-2024-01-10-a-las-8-18-40.png](https://i.postimg.cc/tR6cXG0N/Captura-de-pantalla-2024-01-10-a-las-8-18-40.png)](https://postimg.cc/qgkwLYvN) [![Captura-de-pantalla-2024-01-10-a-las-8-20-17.png](https://i.postimg.cc/jq8Bg4rG/Captura-de-pantalla-2024-01-10-a-las-8-20-17.png)](https://postimg.cc/14qW46XH)

[![Captura-de-pantalla-2024-01-10-a-las-8-20-29.png](https://i.postimg.cc/2yzsM0HZ/Captura-de-pantalla-2024-01-10-a-las-8-20-29.png)](https://postimg.cc/dkxNTjcs)


## Configuracion de desarrollo
Clone el repositorio y ejecute los siguientes comandos para ejecutat la aplicacion
```
flutter pub get
flutter run
```

1. copiar el .env.template y renombrarlo a .env
2. cambiar las variables de entorno (The MovieDB)
3. cambios en la entidad, hay que ejecutar el comando 
```
flutter pub run build_runner build
```


## Descripción breve de cada paquete utilizado en el desarrollo de la app
```
animate_do (^3.0.2):
Proporciona animaciones predefinidas para widgets en Flutter.

bloc (^8.1.2) y flutter_bloc (^8.1.3):
Implementa el patrón BLoC (Business Logic Component) para gestionar el estado de la aplicación.

card_swiper (^3.0.1):
Ofrece un widget de presentación de tarjetas en forma de swiper (deslizamiento).

cupertino_icons (^1.0.2):
Contiene iconos específicos de Cupertino para ser utilizados en aplicaciones Flutter.

dio (^5.4.0):
Una biblioteca HTTP para realizar solicitudes a servidores y manejar respuestas.

equatable (^2.0.5):
Ayuda en la implementación de objetos de valor (value objects) de manera fácil y eficiente.

flutter_animate (^4.3.0):
Proporciona animaciones personalizadas para widgets en Flutter.

flutter_dotenv (^5.1.0):
Permite cargar variables de entorno desde un archivo .env.

flutter_zoom_drawer (^3.1.1):
Implementa un drawer (cajón) con efecto de zoom.

go_router (^13.0.0):
Un enrutador para Flutter que facilita la navegación entre pantallas.

google_fonts (^5.1.0):
Proporciona acceso fácil a las fuentes de Google en las aplicaciones Flutter.

intl (^0.19.0):
Ofrece funciones para internacionalización y formateo de fechas y números.

isar (^3.1.0+1) y isar_flutter_libs (^3.1.0+1):
ORM (Object-Relational Mapping) para Flutter, facilita el trabajo con bases de datos.

shimmer (^3.0.0):
Crea efectos de brillo o resplandor en los widgets, comúnmente utilizados para indicar carga.

path_provider (^2.1.1):
Proporciona funciones para obtener rutas de directorios en el sistema de archivos.

flutter_staggered_grid_view (^0.7.0):
Implementa un widget de cuadrícula en cascada que permite diseños de cuadrícula irregulares.

mockito (^5.4.0):
Una biblioteca de prueba para crear objetos simulados (mocks) y realizar pruebas unitarias.
```
## Dev Dependencies:
```
build_runner (^2.4.7):
Herramienta para generar código durante el tiempo de compilación.

flutter_launcher_icons (^0.13.1):
Facilita la personalización de los iconos de la aplicación.

flutter_lints (^2.0.0):
Proporciona reglas de lint adicionales para mejorar la calidad del código.

flutter_test:
Contiene herramientas para realizar pruebas unitarias en Flutter.

isar_generator (^3.1.0+1):
Generador de código para Isar, facilita la integración de Isar con el código Flutter.
```
Estos paquetes abarcan una variedad de funcionalidades, desde gestión de estado hasta manipulación de redes, animaciones y bases de datos.
