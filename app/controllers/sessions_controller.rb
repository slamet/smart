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
	
	if user = User.authenticate(params[:session][:email],
		       params[:session][:password])
	if params[:remember_me]
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token  
    end
    #sign_in user
      flash.now[:success] = "Logged in"
     cookies[:auth_token] = user.auth_token 
     redirect_back_or user
    #redirect_to user, :notice => "Logged in!"
   else
    flash.now[:error] = "Invalid email/password combination."
    @title = "Sign in"
    render "new"
  end
end


  def destroy
  	cookies.delete(:auth_token)
    #sign_out
	redirect_to root_path, :notice => "Logged out!"
  end
end

