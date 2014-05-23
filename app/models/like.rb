class Like < ActiveRecord::Base
   attr_accessible :user_id, :movie_id,:is_like
  belongs_to :user
  belongs_to :movie
end
