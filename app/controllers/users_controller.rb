class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(10)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
    render 'show_follow'
  end

	def index
    @title =" All Users"
    #@users = User.all
    @users = User.order("name").page(params[:page]).per(5)

    respond_to do |format|
      format.html
      format.json { render json: @users}
    end  
  end
    # GET /users/1
    # GET /users/1.json
	def show
       @user = User.find(params[:id])
       @microposts = @user.microposts.page(params[:page]).per(20)
       @title = @user.name 
       respond_to do |format|
       	   format.html # show.html.erb
       	   format.json {render json: @user }
           
       end 
    end


    def new
      @user = User.new
       @title ="sign up"
    end






    def create
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        UserMailer.registration_confirmation(@user).deliver
        
        flash[:success] = "Sign up is Success!"
        
        redirect_back_or @user

      else
        @title ="sign up"
        render 'new'
      end
    end

  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end

  def update

    @user = User.find(params[:id])
  if @user.update_attributes(params[:user])
  flash[:success] = "Profile updated."
  redirect_to @user
  else
  @title = "Edit user"
  render 'edit'
 end
end


private

def authenticate
  deny_access unless signed_in?
end

def correct_user
@user = User.find(params[:id])
redirect_to(root_path) unless current_user?(@user)
end

end


    

