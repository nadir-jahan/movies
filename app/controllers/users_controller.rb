class UsersController < ApplicationController

def create
	user= User.find_by_email(params[:user][:email])
	if user.nil?
	User.create(:email=> params[:user][:email],:name=> params[:user][:name])
	 render :json =>  {:message =>" User was successfully created" }  
	else
	render :json =>  { :message =>" Email address is already in used" } 	
   end
end

def update
	user= User.find_by_id(params[:id])
	if user.nil?
	 render :json =>  {:message =>" User record does not exist" }  
	else
		user.attributes = params[:user]
		user.save
	#user.update_attributes(:name=> params[:user][:name],:email=> :params[:user][:email])
	render :json =>  { :message =>" User has been successfully updated" } 	
   end
end


def destroy
	user= User.find_by_id(params[:id])
	if user.nil?
	 render :json =>  {:message =>" User record does not exist" }  
	else
		user.destroy
	#user.update_attributes(:name=> params[:user][:name],:email=> :params[:user][:email])
	render :json =>  { :message =>" User has been successfully deleted from system" } 	
   end
end


end
