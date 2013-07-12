class AddIndexToFriendships < ActiveRecord::Migration
  def change
  	add_index :friendships, :user_id
  	add_index :messages, :user_id

  end
end
