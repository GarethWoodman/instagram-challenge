class UsersController < ApplicationController
  def new
    # Initializes user object for view
    @user = User.new
  end

  def create
    # Get a user object from user params
    @user = User.new(user_params)

    # Check if user object can be 'saved' to the database
    if @user.save
      redirect_to '/login'
    else
      redirect_to '/signup', notice: 'Invalid submission'
    end
  end

  def show
    @user = User.find(session[:user_id])
    @picture = Picture.new
  end

  private
  # Formats the params so that 'user' store them as arguements
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
