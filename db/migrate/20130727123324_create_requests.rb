class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :uid
      t.string :fid
      t.string :status

      t.timestamps
    end
  end
end
