class AddCookieTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cookie_token, :string
  end
end
