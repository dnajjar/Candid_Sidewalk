class AddImageToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :image, :string
  end
end
