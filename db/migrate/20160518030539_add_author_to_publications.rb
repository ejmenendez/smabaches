class AddAuthorToPublications < ActiveRecord::Migration
  def change
    add_reference :publications, :author, index: true
  end
end
