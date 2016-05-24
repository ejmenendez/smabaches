class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :description
      t.boolean :published
      t.decimal :latitude, :precision => 20, :scale => 16
      t.decimal :longitude, :precision => 20, :scale => 16

      t.timestamps
    end
  end
end
