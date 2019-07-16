class FavoritesController < ApplicationController
  before_action :set_clothe
  def index 
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all
	end
  
  # def create
  #   favorite = current_user.favorites.create(post_id: params[:post_id])
  #   @clothe.reload
  # end

  # def destroy
  #   favorite = current_user.favorites.find_by(id: params[:id]).destroy
  #   @clothe.reload
  # end

  def create
    @favorite = Favorite.create(user_id: current_user.id, clothe_id: params[:clothe_id])
    @clothes = Clothe.where(clothe_id: params[:clothe_id])
    @clothe.reload
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, clothe_id: params[:clothe_id])
    favorite.destroy
    @favorites = Favorite.where(clothe_id: params[:clothe_id])
    @post.reload
  end

  private

  def set_clothe
    @clothe = Clothe.find(params[:clothe_id])
  end
end
