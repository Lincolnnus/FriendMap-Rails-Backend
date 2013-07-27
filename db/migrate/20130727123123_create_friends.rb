class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :uid1
      t.integer :uid2

      t.timestamps
    end
  end
end
