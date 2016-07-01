class RemovePublishedFromPublication < ActiveRecord::Migration
  def up
    remove_column :publications, :published
  end

  def down
    add_column :publications, :published, :boolean
  end
end
