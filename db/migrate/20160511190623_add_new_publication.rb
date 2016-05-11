class AddNewPublication < ActiveRecord::Migration
  def change
    Publication.create!({description: 'Primer publicacion',published: true,latitude: 2, longitude: 1})
  end
end
