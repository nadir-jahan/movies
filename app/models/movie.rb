class Movie < ActiveRecord::Base
   attr_accessible :title, :genres,:year
   has_many :likes
   has_many :users
end

