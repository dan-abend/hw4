class UsersController < ApplicationController
  def new
    @user = User
  end

  def create
    @user = User.new(params["user"])
    plain_text_password = params["user"]["password"]
    @user.password = BCrypt::Password.create(plain_text_password)
    @user.save
    redirect_to "/users/#{@user.id}"
  end
end
