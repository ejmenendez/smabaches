class Publication < ActiveRecord::Base
  
  validates :author, presence:true
  belongs_to :author, class_name: 'User'
  
  mount_uploader :photo, PhotoUploader, ignore_integrity_errors: true
  
end
