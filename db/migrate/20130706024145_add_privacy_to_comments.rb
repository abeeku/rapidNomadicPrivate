class AddPrivacyToComments < ActiveRecord::Migration
  def change
    add_column :comments, :privacy, :string

  end
end
