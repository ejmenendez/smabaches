class AddCategoryToPublications < ActiveRecord::Migration
  def change
    add_reference :publications, :category, index: true
  end
end
