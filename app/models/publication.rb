class Publication < ActiveRecord::Base
  #para la gema commontator
  acts_as_commontable
    #para la gema act_as_votable
  acts_as_votable
  
  #atributos virtuales para usar en el geocoder calle y numero
  attr_accessor :address #nombre de la calle y altura
  attr_accessor :number #altura, solo para poder usar en el form
    
  geocoded_by :street
  validates :author, :title, :description, :latitude, :longitude, presence: true

  belongs_to :author, class_name: 'User'

    has_attached_file :photo,
        styles: {medium: "400x400#", thumb: "200x200#",thumb1: "300x250"},
        default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
    belongs_to :category

    def self.filter(filter)
      if filter.present?
        where({category_id: filter})
      else
        all
      end

    end

    def self.search(search)
      if search.present?
        where('title LIKE :search OR description LIKE :search', search: "%#{search}%")
      else
        all
      end

    end
end
