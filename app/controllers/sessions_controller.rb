class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user 
      session[:user_id] = user.id 
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else 
      flash.now[:danger] = "There was something wrong with your login details"
      render 'new'
    end 
  end 

  def destroy
    session[:user_id] = nil 
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end

end
