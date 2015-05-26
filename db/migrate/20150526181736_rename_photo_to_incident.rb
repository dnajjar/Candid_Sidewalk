class RenamePhotoToIncident < ActiveRecord::Migration
  def change
    rename_table :photos, :incidents
  end
end
