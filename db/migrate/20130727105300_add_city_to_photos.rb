class AddCityToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :city, :string
  end
end
