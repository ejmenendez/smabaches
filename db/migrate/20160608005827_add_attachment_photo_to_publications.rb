class AddAttachmentPhotoToPublications < ActiveRecord::Migration
  def self.up
    change_table :publications do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :publications, :photo
  end
end
