class ChangeLatitudeLongitudeColumnType < ActiveRecord::Migration
  
  def change
     change_column(:publications, :latitude, :decimal, :precision => 20, :scale => 16 )
     change_column(:publications, :longitude, :decimal, :precision => 20, :scale => 16 )
  end
  
end
