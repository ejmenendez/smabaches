# SMA Baches

Sitio para denuncia de baches y grafittis en San Martín de los Andes

## Antes de comenzar

Éste documento cubre los pasos necesarios para ejecutar el programa en **Linux**.

### Requisitos

#### Ruby

Tener instalado el Ruby en su computadora. Para comprobar si Ruby está instalado, ingrese el comando
```
$ ruby --version
```
en su consola.

Debería aparecer la versión de Ruby instalada en su sistema.
El programa fue creado utilizando la versión `ruby 2.0.0p598`

Si no tiene **Ruby** instalado, puede consultar cómo instalarlo en [ésta página](https://www.ruby-lang.org/es/downloads/)

#### Rails

SMABaches es una aplicación Ruby on Rails, por lo que necesita instalar rails para poder ejecutarla localmente.

La instalación de Rails se ejecuta mediante el comando, una vez instalado **Ruby**
```
$ gem install rails
```
Puede encontrar las instrucciones paso a paso para instalar **Rails** en [ésta página](https://www.rubyonrails.org.es/instala.html/)

#### Bundler (Recomendado)

La gema bundler le permitirá instalar las dependencias necesarias para ejecutar el programa.
La misma se instala ingresando el siguiente comando:
```
$ gem install bundler
```

## Instalación de la aplicación

Descargue los archivos contenidos en el repositorio. A la derecha, sobre la lista de archivos,
hay disponible una opción para descargar todo como un archivo **.zip**

Una vez descargado (y descomprimido en la carpeta elegida, si es el caso), debe descargar las
dependencias necesarias para poder utilizar el programa. Si instaló Bundler, ingrese en la consola:
```
$ bundle install
```
y se descargarán las dependencias necesarias.

Si no instaló Bundler, debe ingresar los siguientes comandos en la consola:

```
$ gem 'gmaps4rails'
$ gem 'geocoder'
$ gem 'geokit-rails'
$ gem 'pundit', '~>1.1.0'
$ gem 'commontator', '~> 4.11.1'
$ gem 'acts_as_votable'
$ gem 'imagemagick-identify', '~> 0.0.1'
$ gem 'paperclip'
$ gem 'compass-rails'
$ gem 'chosen-rails'
$ gem 'omniauth-facebook'
$ gem 'rails-i18n', '~> 4.0.0'
$ gem 'devise-i18n'
$ gem 'i18n_generators'
$ gem 'rspec-rails', '~>3.0'
```
#### Gemas que utiliza la aplicación

##### **gmaps4rails**
Se instala para utilizar los servicios de [Google Maps API](https://developers.google.com/maps/?hl=es) , permitiendo incluir mapas y marcadores dentro de los mapas de la aplicación

Instrucciones para **gmaps4rails** en [ésta página](https://github.com/apneadiving/Google-Maps-for-Rails)

##### **geocoder**
Se utiliza para obtener latitud y longitud con una dirección,
y ejecutar querys en una base de datos con las coordenadas de un mapa

Instrucciones para **geocoder** en [ésta página](https://github.com/alexreisner/geocoder)

##### **geokit-rails**
Permite buscar modelos que tengan latitud y longitud dentro de un rectángulo
delimitado por dos coordenadas.

Instrucciones para **geokit-rails** en [ésta página](https://github.com/geokit/geokit-rails)

##### **pundit**
Realiza el manejo de permisos por usuario para distintas acciones y modelos

Instrucciones para **pundit** en [ésta página](https://github.com/elabs/pundit)

##### **commontator**
Agrega la posibilidad de añadir comentarios en las publicaciones

Instrucciones para **commontator** en [ésta página](https://github.com/lml/commontator)

##### **acts_as_votable**
Gema que se añade a **commontator** para que los usuario puedan poner votos positivos y negativos a las publicaciones.

Instrucciones para **commontator** en [ésta página](https://github.com/ryanto/acts_as_votable)

##### **paperclip** e **imagemagick-identify**
Se utilizan para el manejo de las fotos que se adjuntan a las publicaciones

Instrucciones para **paperclip** en [ésta página](https://github.com/ryanto/acts_as_votable)

[ImageMagick](http://www.imagemagick.org/script/identify.php)

##### **IMPORTANTE:** se debe instalar **ImageMagick** y la gema **rmagick** en su sistema para poder utilizar la aplicación localmente:
Se puede descargar desde [ésta página](http://www.imagemagick.org/script/binary-releases.php), o instalar por línea de comando:
```
$ sudo apt-get install imagemagick
$ gem install rmagick
```

##### **compass-rails** y **chosen-rails**
Crean una lista desplegable en la que se puede buscar ingresando texto, utilizado para las calles.

Instrucciones sobre ambas gemas en [ésta página](https://github.com/tsechingho/chosen-rails)

##### **omniauth-facebook**
Permite a los usuarios ingresar al sistema a través de Facebook

Instrucciones para **omniauth-facebook** en [ésta página](https://github.com/mkdynamic/omniauth-facebook)

##### **Internacionalización**
Se realiza a través de las gemas:

[rails-i18n](http://guides.rubyonrails.org/i18n.html) y para Devise [devise-i18n](https://github.com/tigrish/devise-i18n)

Para generar automáticamente los archivos [yaml](https://yaml.org) de los modelos de la aplicación se utilizó [i18n-generators](https://github.com/amatsuda/i18n_generators)


##### **IMPORTANTE:** se debe instalar **mailcatcher** para poder comprobar que se envían los correos electrónicos desde la aplicación cuando se ejecuta localmente.

```
$ gem install mailcatcher
```

luego se podrán ver los mensajes en la dirección local, puerto 1080 (http://localhost:1080).
[Más iformación aquí.](https://mailcatcher.me/)


## Configuración de la aplicación

#### Base de datos
La aplicación se encuentra configurada para utilizar la el motor de base de datos [MySQL](https://www.mysql.com/). Debe tener instalado MySQL para poder utilizarla.
Puede cambiar la configuración en `config/database.yml`

Para ver más información sobre cómo configurar una base de datos, [click aquí](http://guides.rubyonrails.org/configuring.html#configuring-a-database)

El esquema de la base de datos se puede ver en `db/schema.rb`

#### Idioma
La aplicación se encuentra configurada para idioma **español**. Los diccionarios se encuentran en `config/locales/` y sus subdirectorios.
Puede cambiar la configuración en `config/application.rb` en la línea

```
config.i18n.default_locale = :es
```

Y dentro de los archivos de configuración de entornos en `config/environments/` puede cambiar la línea:

```
config.i18n.available_locales = [:es, :en]
```
para indicar los idiomas disponibles.

**IMPORTANTE:** si se incluyen otros idiomas, deben estar disponibles los diccionarios correspondientes. Para ver más información sobre el tema, [click aquí.](http://guides.rubyonrails.org/i18n.html)

#### Datos que se crean con la aplicación (local)

El archivo **seeds.rb** contiene los usuarios esteban@example.com y rodri@example.com como administradores. Se crea otro usuario común usuario@example.com
Todos los usuarios tienen la clave 12345678

Además, en la migración <> se crean 400+ calles pertenecientes al ejido de San Martín de los Andes

Se crean aparte 15 publicaciones, 10 baches y 5 graffitis que pertenecen a los usuarios esteban@example.com y rodri@example.com

Puede cambiar los datos que se generan en `db/seeds.rb`

## Uso de la aplicación

**Página principal:**  
Muestra el mapa con los marcadores en donde se encuentran las publicaciones actuales, junto con una lista de las últimas publicaciones.
A la izquierda hay un panel de búsqueda, en los que se pueden aplicar los siguientes criterios:

  * Por cattegoría: Elija entre Baches, Grafittis o Todos (se muestran las publicaciones de ambas categorías)
  * Por campo libre, se ingresa un texto y se devuelven las publicaciones que lo contengan ya sea en su título y/o en su descripción.
  * Por mapa: Se desplaza el mapa hasta la zona de la que están las publicaciones que se quieren ver, automáticamente mostrará los marcadores que se encuentran dentro del área y luego en la búsqueda traerá los datos de dichas publicaciones.

Para buscar por cualquier criterio se debe apretar el botón "Buscar"

**Listado de publicaciones**  
A la derecha hay una lista de publicaciones, si usted inició sesión podrá aceder a la pestaña "Mis publicaciones" en la que se listarás las publicaciones de las cuales es autor dentro del criterio de búsqueda actual.
Al hacer click sobre las publicaciones de la lista, se mostrará una ventana con el detalle de la misma. Si en dicha ventana se hace click en "Ver" se muestra una página con los detalles completos de la publicación.

En el menú superior tendrá las opciones para ir al inicio, ingresar o cerrar sesión según corresponda, para iniciar sesión debe crear un usuario.

Si no se inicia sesión, sólo se podrán ver las publicaciones, no editar, agregar ni borrar.

**Crear Usuario**  
Se debe registrar como usuario para poder crear, editar, borrar o comentar publicaciones. Se puede crear un usuario haciendo click en el menú superior en "Ingresar" y luego cuando se pide usuario y clave, hacer click en el vínculo "Crear Usuario"

**Perfil del Usuario**  
Puede ingresar a su perfil de usuario haciendo click sobre su el vínculo Usuario:<su dirección de correo>, que se encuentra en el menú superior

**IMPORTANTE:** el sistema enviará un correo a la dirección que registró con el usuario con un vínculo para confirmar el usuario creado.

**¿Olvidó su clave?**  
Si olvidó su clave, puede hacer click en el vínculo ¿Olvidó su clave?, se le pedirá su dirección de correo y se le enviará un mensaje con instrucciones para crear una nueva clave.

**Nueva publicación**  
Al hacer click sobre el botón "Nueva publicación", si usted no inició sesión se le pedirá que la inicie, o cree un usuario si no creó uno todavía.
Al acceder a la página de creación de publicaciones, el navegador le pedirá que comparta su ubicación actual. Si usted accede, se creará un marcador sobre el mapa con su ubicación actual. Si no, debe buscar la ubicación seleccionando una calle e ingresando una altura. Puede hacer click sobre el mapa para cambiar de lugar el marcador de ubicación de la publicación.
Luego debe ingresar un título y una descripción de la publicación, indicar si es un bache o un graffiti y adjuntar una foto. Todos los campos son obligatorios para poder grabar la publicación.

**Editar una publicación**  
Para poder editar una publicación, usted debe ser un usuario registrado y ser el autor de la misma. La ventana de edición tendrá los valores actuales de la publicación en los distintos campos, usted puede cambiarlos de la misma manera que con una publicación nueva, recordando que los campos son obligatorios.

**Borrar una publicación**  
Usted podrá borrar solamente sus publicaciones, para esto haga click en el botón "Borrar" ya sea en la ventana de detalles o en la de vista de la publicación. Se le pedirá una confirmación para el borrado.

**Votar publicación**  
Se puede asignaar un voto positivo o negativo por usuario a cada publicación. Se puede realizar desde la ventana de detalles o de la Vista, donde también se muestra el porcentaje de cada tipo de votos para la publicación

**Denunciar una Publicación**  
Si usted considera que una publicación es inapropiada, puede denunciarla haciendo click sobre el ícono rojo en la ventana de detalles. Se les enviará un correo electrónico a los administradores para que moderen la publicación denunciada.

**Comentar publicación**  
Si ha iniciado sesión, puede comentar una publicación con su usuario. También puede votar como positivos o negativos otros comentarios (un voto por cada uno), y borrar comentarios si usted es el autor

**Borrar usuario**  
Si no desea utilizar más la aplicación como usuario registrado, puede borrarlo ingresando a su perfil.

## Tests implementados

Por medio de la gema **rspec-rails** se realizaron los siguientes tests

  * PublicationPolicy, ver `specs/policies/publication_policy_spec.rb`  
    Resultado:  
    PublicationPolicy  
      new?  
        no se puede crear publicación sin usuario ingresado  
        cualquier usuario ingresado puede crear publicación  
      destroy?  
        no se puede borrar publicación sin usuario logueado  
        no puede borrar la publicación un usuario que no es el autor  
        el autor puede borrar su publicación  
        un administrador puede borrar cualquier publicación  
      edit? y update?  
        no se puede editar publicación sin usuario ingresado  
        no puede editar la publicación un usuario que no es el autor  
        el autor puede editar su publicación  
        un administrador puede editar cualquier publicación  

  * Publication, ver `specs/policies/publication_spec.rb`  
    Resultado:  
      Publication  
      Validaciones  
        no es válido si el título está ausente  
        el título no es válido si tiene menos de 5 caracteres  
        es válido si el título tiene 5 o más caracteres  
        no es válido si la descripción está ausente  
        no es válido si la descripción tiene menos de 10 caracteres  
        es válido si la descripción tiene 10 o más caracteres  
        no es válido si no tiene autor asignado  
        no es válido si no tiene categoría asignada  
        no es válido si no tiene latitud asignada  
        no es válido si no tiene longitud asignada  
        no es válido si no tiene foto adjunta  
        no es válido si no tiene calle asignada  
        no es válido si no tiene altura asignada  

  * PublicationsController, ver `specs/policies/publications_controller_spec.rb`  
    Resultado:  
    PublicationsController  
      GET index  
        estado OK llamada al índice  
        render del index  
        render del show   
        render del edit  
        render del new  
        la colección de publicaciones es igual a la creada  
        prueba de la colección de publicaciones de current_user  

  * Test de Request, ver `specs/requests/request_new_publication_spec.rb`  
    Para este test se agregó `specs/shared_contexts.rb` y se modificó  `specs/spec_helper.rb`, con el fin de poder ingresar un usuario a la aplicación desde el test. El resultado, sin embargo, no parece el esperado
    Resultado  
      Seguimiento de la creación de una publicación  
        render y seguimiento  
        new muestra el template correcto  


## Problemas conocidos

#### Google Chrome puede NO pedir localización
Si ésto sucede, combruebe que esté ingresando a la página con protocolo https.

#### Geolocalización puede devolver un error "REQUEST_DENIED"
Si sucede esto, debe consultar en la api de Google Maps [cómo obtener una clave de API de Google Maps](https://developers.google.com/maps/documentation/javascript/get-api-key?hl=es), para que la aplicación pueda acceder al servicio desde donde está alojada.

Si se está ejecutando localmente, puede probar en `app/views/layouts/application.html.erb` dejar el parámetro `key=` sin valor en la  línea

```
'<script src="//maps.google.com/maps/api/js?key=&libraries=geometry"></script>'
```

#### Selector de calles y geolocation:
Puede ocurrir que el selector de calles en el formulario para Nuevas Publicaciones y Modificación de Publicaciones `app/views/publications/_form.html.erb` no elija la calle devuelta por la geolocalización de Google


## Autores

Rodrigo Chávez

Esteban Menéndez
