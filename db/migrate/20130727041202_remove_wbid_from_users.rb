class RemoveWbidFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :wbid, :string
  end
end
