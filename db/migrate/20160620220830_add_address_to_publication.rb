class AddAddressToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :address, :string
  end
end
