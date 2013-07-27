class AddProvinceToPhoto < ActiveRecord::Migration
  def change
  	add_column :photos, :province, :string
  end
end
