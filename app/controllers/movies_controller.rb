class MoviesController < ApplicationController


def create
	Movie.create(:title=> params[:movie][:title],:genres=> params[:movie][:genres],:year=>params[:movie][:year])
	 render :json =>  {:message =>" Movie was successfully created" }  	
end

def update
	movie = Movie.find_by_id(params[:id])
	if movie.nil?
	 render :json =>  {:message =>" Movie record does not exist" }  
	else
		movie.attributes = params[:movie]
		movie.save
	#user.update_attributes(:name=> params[:user][:name],:email=> :params[:user][:email])
	render :json =>  { :message =>" Movie has been successfully updated" } 	
   end
end


def destroy
	movie= Movie.find_by_id(params[:id])
	if movie.nil?
	 render :json =>  {:message =>" Movie record does not exist" }  
	else
		movie.destroy
	#user.update_attributes(:name=> params[:user][:name],:email=> :params[:user][:email])
	render :json =>  { :message =>" Movie has been successfully deleted from system" } 	
   end
end
def like
	user = User.find_by_id( params[:movie][:user_id])
	 # render :json =>  {:message =>" You have already liked this movie" }
	movie = Movie.find_by_id(params[:id])
	
	already_like = Like.where(:user_id=> user.id, :movie_id=> movie.id,:is_like=> true )
	if already_like.present?
	 render :json =>  {:message =>" You have already liked this movie" }
	else
	   user.likes.create(:movie_id=>movie.id,:is_like=>params[:movie][:is_like])
	   render :json =>  {:message =>" You have successfully liked this movie" }
    end
end	







end
