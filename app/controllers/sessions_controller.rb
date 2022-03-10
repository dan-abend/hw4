class SessionsController < ApplicationController
  def new
  end

  def create
    entered_email = params["email"]
    enetered_password = params["password"]

    if @user
      if BCrypt::Password.new(@user.password) == enetered_password
        session["user_id"] = @user.id

        flash[:notice] = "Welcome!"
        redirect_to "/places"
      else 
        flash[:notice] = "Password is incorrect"
        redirect_to "/sessions/new"
      end 
  else
      flash[:notice] = "No user with that email address"
      redirect_to "/sessions/new"
  end

  def destroy
  end
end
  