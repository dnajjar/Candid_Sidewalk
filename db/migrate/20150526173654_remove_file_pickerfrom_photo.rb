class RemoveFilePickerfromPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :filepicker_url, :string
  end
end