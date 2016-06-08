class Publication < ActiveRecord::Base
  #para la gema commontator
  acts_as_commontable
  
  validates :author, :title, :description, :latitude, :longitude, presence: true #:photo, 
  belongs_to :author, class_name: 'User'
  
  mount_uploader :photo, PhotoUploader, ignore_integrity_errors: true
  
end
