class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :location
      t.integer :user_id
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps null: false
    end
  end
end