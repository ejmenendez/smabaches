source 'https://rubygems.org'

gem 'rails', '4.1.4'

### OpenShift Online changes:

# Fix the conflict with the system 'rake':
gem 'rake', '~> 0.9.6'

# Support for databases and environment.
# Use 'sqlite3' for testing and development and mysql and postgresql
# for production.
#
# To speed up the 'git push' process you can exclude gems from bundle install:
# For example, if you use rails + mysql, you can:
#
# $ rhc env set BUNDLE_WITHOUT="development test postgresql"
#
group :development, :test do
  gem 'mysql2'
  gem 'minitest'
  gem 'thor'
	#gema para testear
	gem 'rspec-rails', '~>3.0'
end

# Add support for the MySQL
group :production, :mysql do
  gem 'mysql2'
end

### / OpenShift changes

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'devise','~> 3.5.6'
gem 'rails_admin','~> 0.8.1'
gem 'rolify','~> 5.1'
gem 'bootstrap-sass'

group :development do
	gem 'rails_layout'
end

#google maps
gem 'gmaps4rails'

#geocoder para sacar latitud y longitud con una dirección
#y hacer querys en la base de datos con las coordenadas de un mapa
gem 'geocoder'

#permite buscar modelos que tengan latitud y longitud dentro de un rectángulo
#que se puede delimitar con las coordenadas delmapa
gem 'geokit-rails'

#manejo de permisos
gem 'pundit', '~>1.1.0'

#comentarios para las publicaciones
gem 'commontator', '~> 4.11.1'

#votos para las publicaciones via commontator
gem 'acts_as_votable'

#para el manejo de las fotos
gem 'imagemagick-identify', '~> 0.0.1'
gem 'paperclip'

#para el autocompletar de las calles
gem 'compass-rails'
gem 'chosen-rails'

#Autorizacion por facebook
gem 'omniauth-facebook'

#internacionalización para rails
gem 'rails-i18n', '~> 4.0.0'

#internacionalización para devise
gem 'devise-i18n'

#generador de yml para i18n
gem 'i18n_generators'

