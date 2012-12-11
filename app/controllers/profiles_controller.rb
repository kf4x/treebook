class ProfilesController < ApplicationController
  
  def show
  	#find user by profile_name(  params->root/somename  )
  	@user = User.find_by_profile_name(params[:id]) #params arg name doesnt really matter but keep it consistant
  													# change here, func test, routes
  	if @user
  		#use has_many relationship from user model. 
  		@statuses = @user.statuses.all
  		render :action => "show"

  	else
  		render file: 'public/404', status: 404, formats: [:html]	#render 404page from public folder
  	end

  end


end
