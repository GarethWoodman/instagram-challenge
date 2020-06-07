class SessionsController < ApplicationController
  def new
    # Initialize user for login form
    @user = User.new
  end

  def create
    # Get user by email
    user = User.find_by(email: params[:user][:email])

    # If user logs in with correct password, save the users id in a session
    # Else redirect to the login page
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/login"
    end
  end

  def destroy
    # Destroy user session by assigning nil
    # Then redirect to login
    session[:user_id] = nil
    redirect_to "/login"
  end
end
