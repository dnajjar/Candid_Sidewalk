class RemoveLocationFromIncidents < ActiveRecord::Migration
  def change
    remove_column :incidents, :location, :string
  end
end
