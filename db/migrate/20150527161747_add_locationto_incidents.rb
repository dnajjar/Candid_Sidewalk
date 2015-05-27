class AddLocationtoIncidents < ActiveRecord::Migration
  def change
     add_column :incidents, :location, :string
  end
end
