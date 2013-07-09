class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.text :bio
      t.string :website
      t.string :location
      t.integer :user_id
      t.string :post_color

      t.timestamps
    end
    add_index :user_infos, :user_id
  end
end
