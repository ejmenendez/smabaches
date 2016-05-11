class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :description
      t.boolean :published
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
