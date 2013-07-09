class AddPrivacyToComments < ActiveRecord::Migration
  def change
    add_column :comments, :privacy, :string
    add_index :comments, :user_id
  end
end
