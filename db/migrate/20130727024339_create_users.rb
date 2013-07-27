class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :rrid
      t.string :thumbnail
      t.string :wbid

      t.timestamps
    end
  end
end
