class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create 
    @user = User.create params[:user]
    flash[:alert] = "Just created #{@user.fname}"
    redirect_to users_path
  end



end
