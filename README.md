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

##### **compass-rails** e **chosen-rails**
Crean una lista desplegable en la que se puede buscar ingresando texto, utilizado para las calles.

Instrucciones sobre ambas gemas en [ésta página](https://github.com/tsechingho/chosen-rails)

##### **omniauth-facebook** 
Permite a los usuarios ingresar al sistema a través de Facebook

Instrucciones para **omniauth-facebook** en [ésta página](https://github.com/mkdynamic/omniauth-facebook)

##### **Internacionalización**
Se realiza a través de las gemas: 

[rails-i18n](http://guides.rubyonrails.org/i18n.html)
[devise-i18n](https://github.com/tigrish/devise-i18n)

Para generar automáticamente los archivos [yaml](https://yaml.org) de los modelos de la aplicación se utilizó [i18n-generators](https://github.com/amatsuda/i18n_generators)


##### **IMPORTANTE:** se debe instalar **mailcatcher** para poder comprobar que se envían los correos electrónicos desde la aplicación cuando se ejecuta localmente.

```
$ gem install mailcatcher
```

luego se podrán ver los mensajes en la dirección local, puerto 1080 (http://localhost:1080)
[Más iformación aquí](https://mailcatcher.me/)


## Configuración de la aplicación

#### Base de datos
La aplicación se encuentra configurada para utilizar la el motor de base de datos [MySQL](https://www.mysql.com/). Debe tener instalado MySQL para poder utilizarla.
Puede cambiar la configuración en `config/database.yml`

Para ver más información sobre el tema, [click aquí](http://guides.rubyonrails.org/configuring.html#configuring-a-database)

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

**IMPORTANTE:** si se incluyen otros idiomas, deben estar disponibles los diccionarios correspondientes. Para ver más información sobre el tema, [click aquí](http://guides.rubyonrails.org/i18n.html)

#### Datos que se crean con la aplicación (local)

El archivo **seeds.rb** contiene los usuarios esteban@example.com y rodri@example.com como administradores. Se crea otro usuario común usuario@example.com
Todos los usuarios tienen la clave 12345678

Además, en la migración <> se crean 400+ calles pertenecientes al ejido de San Martín de los Andes


Se crean aparte 15 publicaciones, 10 baches y 5 graffitis que pertenecen a los usuarios esteban@example.com y rodri@example.com 

Puede cambiar los datos que se generan en `db/seeds.rb`

## Uso de la aplicación

## Problemas conocidos

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






