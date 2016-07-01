class RemoveAddressColumnToPublication < ActiveRecord::Migration
  def up
    remove_column :publications, :address
  end

  def down
    add_column :publications, :address, :string
  end
end
