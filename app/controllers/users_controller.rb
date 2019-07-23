class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :logged_in, only: [:new]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to clothes_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @clothes = Clothe.where(user_id: @user.id).all.order(created_at: 'DESC')
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in
    if logged_in?
      redirect_to clothes_path
    end
  end
end
