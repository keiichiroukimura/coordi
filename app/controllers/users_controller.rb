class UsersController < ApplicationController
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
end
