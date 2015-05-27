class AddLatitudeAndLongitudetoIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :latitude, :real
    add_column :incidents, :longitude, :real
  end
end
