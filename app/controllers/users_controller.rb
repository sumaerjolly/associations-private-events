# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to private events #{@user.name}"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'Account creation failed'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
