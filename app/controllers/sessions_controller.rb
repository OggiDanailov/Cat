class SessionsController < ApplicationController
  
  def destroy 
    session[:user_id] = nil
    flash[:alert] = "Success"
    redirect_to root_path
  end




  def create
    username = params[:username]
    password = params[:password]

    @user = User.where(username: username).first

    if @user.nil?
      flash[:alert] = "Incorrect credentials"
      redirect_to root_path
    else
      if @user.password == password
          session[:user_id] = @user.id
          redirect_to root_path
          flash[:alert] = "Welcome!"
      else
        #wrong password case
        flash[:alert] = "Incorrect credentials"
        redirect_to root_path
      end
    end


  end
end
