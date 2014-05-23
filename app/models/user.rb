class User < ActiveRecord::Base
   attr_accessible :email,:name
 # validate :email uniqness=>true
  has_many :likes
  has_many :movies
end
