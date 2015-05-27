class AddLocationAndUserIdToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :location, :string
    add_column :incidents, :user_id, :integer
  end
end
