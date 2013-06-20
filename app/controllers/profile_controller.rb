class ProfileController < ApplicationController
  def index

  	if session[:id]
  		@user = User.find(session[:id])
  	else
  		redirect_to('/')
  	end
  	
  end

  def update_profile
  	user = User.find(session[:id])

  	new_name = params[:new_name]
  	new_email = params[:new_email]
  	new_avatar_url = params[:new_avatar_url]
  	user.name = new_name
  	user.email = new_email
  	user.img_src = new_avatar_url
  	user.save
  	render(:json => {:success => true, :user => user})
  end

  def update_password
  	user = User.find(session[:id])

  	new_password = params[:new_password]
  	user.password = new_password
  	user.save
  	render(:json => {:success => true})
  end

end