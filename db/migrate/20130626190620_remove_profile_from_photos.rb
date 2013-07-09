class RemoveProfileFromPhotos < ActiveRecord::Migration
  def up
    remove_column :photos, :profile
  end

  def down
    add_column :photos, :profile, :boolean
  end
end
