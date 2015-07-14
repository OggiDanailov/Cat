class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create 
  
   if params[:user][:password] == params[:password_confirmation]
     # @user = User.create params[:user]
     @user = User.create( user_params )
     flash[:alert] = "Your profile has been created"
     @user.save
     session[:user_id] = @user.id
     redirect_to posts_path
   else
     flash[:alert] = "Your password and confirmation did not match."
     redirect_to user_path(:new)
   end

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
  
  private

    # Use strong_parameters for attribute whitelisting
    # Be sure to update your create() and update() controller methods.

    def user_params
      params.require(:user).permit(:avatar, :username, :password, :fname, :lname, :dob, :city)
    end


end
