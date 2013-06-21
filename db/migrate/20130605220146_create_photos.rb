class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.boolean :profile
      t.string :privacy

      t.timestamps
    end
  end
end
