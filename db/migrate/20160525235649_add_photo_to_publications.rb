class AddPhotoToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :photo, :string
  end
end
