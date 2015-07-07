class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create 
    @user = User.create params[:user]
    flash[:alert] = "Just created #{@user.fname}"
    redirect_to users_path
  end

  def show
    @users = User.find params[:id]
  end

  def edit 
    @user = User.find params[:id]
  end

  




end
