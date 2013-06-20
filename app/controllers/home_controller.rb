class HomeController < ApplicationController
  def index
  	
  end

  def attempt_login

  	name = params[:name]
  	
  	password = params[:password]

  	user = User.find_by_name_and_password(name, password)

  	if user
  		session[:id] = user.id
  		render(:json => {:success => true})
  	else
  		render(:json => {:success => false, :message => 'Wrong username or password'})
  	end

  end

  def logout

    session[:id] = nil

  	redirect_to('/')
  end

  

end
