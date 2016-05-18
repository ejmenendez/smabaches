class Publication < ActiveRecord::Base
  validates :author, presence:true
  belongs_to :author, class_name: 'User'
end
