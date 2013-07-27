class AddRRidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rrid, :string
    add_column :users, :wbid, :string
    add_column :users, :sessionKey, :string
    add_column :users, :token, :string
    remove_column :users, :sid, :string
  end
end
