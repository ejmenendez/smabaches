class AddPhotoFingerPrintToPublications < ActiveRecord::Migration
   def up
    add_column :publications, :photo_fingerprint, :string
  end

  def down
    remove_column :publications, :photo_fingerprint
  end
end
