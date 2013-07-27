class User < ActiveRecord::Base
  has_many :photos
  attr_accessible :name, :sid, :thumbnail
end
