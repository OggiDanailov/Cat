class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create 
    @user = User.create params[:user]
    flash[:alert] = "Just created #{@user.username}"
    redirect_to users_path
  end

  def show
    @users = User.find params[:id]
  end

  def edit 
    @user = User.find params[:id]
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes params[:user]
    flash[:alert] = "Just updated #{@user.fname}"
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:alert] = "Just deleted #{@user.fname}"
    redirect_to users_path
  end
  




end
