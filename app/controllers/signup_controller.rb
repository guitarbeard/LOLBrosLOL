class SignupController < ApplicationController
  def index
  	
  end

  def signup

  	name = params[:name]

    used = User.find_by_name(name)

    if used

      render(:json => {:success => false, :message => 'Username already taken!'})

      return false

    end
  	
  	password = params[:password]

    img_src = params[:img_src]

    email = params[:email]

  	user = User.create(:name => name, :password => password, :img_src => img_src, :email => email, :brofists => 0, :bitchslaps => 0)
  	
  	session[:id] = user.id

  	render(:json => {:success => true})
  	
  end

end