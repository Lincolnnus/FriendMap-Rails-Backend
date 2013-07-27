class AddSidToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :rrid, :string
  	add_column :users, :sid, :string
  end
end
