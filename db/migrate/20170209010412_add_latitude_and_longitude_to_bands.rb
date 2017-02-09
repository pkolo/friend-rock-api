class AddLatitudeAndLongitudeToBands < ActiveRecord::Migration[5.0]
  def change
    add_column :bands, :latitude, :float
    add_column :bands, :longitude, :float
  end
end
