class Publication < ActiveRecord::Base
  #para la gema commontator
  acts_as_commontable
  acts_as_votable
  validates :author, :title, :description, :latitude, :longitude, presence: true #:photo,
  belongs_to :author, class_name: 'User'

    has_attached_file :photo, styles: {medium: "400x400#", thumb: "200x200#"}, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
