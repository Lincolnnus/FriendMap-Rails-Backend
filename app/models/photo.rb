class Photo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :lat, :lng
  attr_accessible :img
  has_attached_file :img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
