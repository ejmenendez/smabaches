class Publication < ActiveRecord::Base
  #para la gema commontator
  acts_as_commontable
  
  #para la gema act_as_votable
  acts_as_votable

  #atributos virtuales para usar en el geocoder calle y numero
  #attr_accessor :address #nombre de la calle y altura
  #attr_accessor :number #altura, solo para poder usar en el form
  
  # geocoding con la gema geocoder,  para poder hacer querys con latitud y longitud
  geocoded_by :street, :latitude  => :latitude, :longitude => :longitude 
	
  # ejemplo de geocoding com más de un campo
  #geocoded_by :address
  #def address
  #  [street, city, state, country].compact.join(', ')
  #end

  #validación de los atributos
  validates :author, :title, :description, :latitude, :longitude, presence: true

  #pertenece a un auor
  belongs_to :author, class_name: 'User'
  # y a una categoría (bache-greffiti-etc)
  belongs_to :category
  
  #para la gema clipboard, archivos de imágenes adjuntos
  has_attached_file :photo,
      styles: {medium: "400x400#", thumb: "200x200#",thumb1: "300x250"},
      default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  # para la gema geokit-rails, que se encarga de buscar publicaciones dentro del rectángulo
  # del mapa
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  
  #filtrado
  def self.filter(filter)
    if filter.present?
      where({category_id: filter})
    else
      all
    end
  end
  
  #búsquedas
  def self.search(search)
    if search.present?
      where('title LIKE :search OR description LIKE :search', search: "%#{search}%")
    else
      all
    end
  end
end
