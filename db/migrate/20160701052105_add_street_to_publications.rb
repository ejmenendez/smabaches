class AddStreetToPublications < ActiveRecord::Migration
  def up
    add_column :publications, :street, :string
  end

  def down
    remove_column :publicationsm, :street
  end
end
