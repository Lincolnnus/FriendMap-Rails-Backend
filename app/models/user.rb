class User < ActiveRecord::Base
  has_many :photos
  attr_accessible :name, :rrid, :wbid, :thumbnail
end
