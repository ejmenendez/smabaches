class AddStreetNumberToPublications < ActiveRecord::Migration
  def up
    add_column :publications, :street_number, :integer
  end

  def down
    remove_column :publicationsm, :street_number
  end
end
