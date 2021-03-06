class UsersController < ApplicationController
before_filter :get_user, :only => [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to products_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to products_url
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

  def get_user
    @user = User.find(params[:id])
  end
end