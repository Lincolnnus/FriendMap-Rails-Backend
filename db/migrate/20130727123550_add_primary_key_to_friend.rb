class AddPrimaryKeyToFriend < ActiveRecord::Migration
  def change
  	add_index :friends, ["uid1", "uid2"], :unique => true
  end
end
