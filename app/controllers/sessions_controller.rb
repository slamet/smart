class SessionsController < ApplicationController
  def new
  	@title = "Sign in"
  end

#def create
#	user = User.authenticate(params[:session][:email],
#	params[:session][:password])
#	if user.nil?
#	flash.now[:error] = "Invalid email/password combination."
#	@title = "Sign in"
#	render 'new'
#  else
    
#	cookies.permanent[:auth_token] = user.auth_token
	#sign_in user
#	redirect_to user, :notice => "logged in"
#  end
#end

def create
	
  user = User.authenticate(params[:session][:email],
  params[:session][:password])
  if user.nil?
    flash.now[:error] = "Invalid email/password combination."
    @title = "Sign in"
    render 'new'
  else
sign_in user
redirect_back_or user
  end
end





  def destroy
  	
    sign_out
	redirect_to root_path, :notice => "Logged out!"
  
end
end