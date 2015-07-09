class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create 
    @user = User.create params[:user]
    session[:user_id] = @user.id
    flash[:alert] = "Just created #{@user.username}"
    redirect_to user_path(@user)

  end

  def show
    @post = Post.new
    @user = User.find params[:id]
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
    session[:user_id] = nil
    flash[:alert] = "Just deleted #{@user.fname}"
    redirect_to users_path
  end
  




end
