class Publication < ActiveRecord::Base
  
  validates :author, :title, :description, :photo, :latitude, :longitude, presence: true
  belongs_to :author, class_name: 'User'
  
  mount_uploader :photo, PhotoUploader, ignore_integrity_errors: true
  
end
