class FavoritesController < ApplicationController
  before_action :set_clothe, only: [:create, :destroy]
  def index 
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all.order(created_at: "DESC")
	end
  
  def create
    @favorite = Favorite.create(user_id: current_user.id, clothe_id: params[:clothe_id])
    @favorites = Favorite.where(clothe_id: params[:clothe_id])
    @clothe.reload
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, clothe_id: params[:clothe_id])
    favorite.destroy
    @favorites = Favorite.where(clothe_id: params[:clothe_id])
    @clothe.reload
  end

  # private

  def set_clothe
    @clothe = Clothe.find(params[:clothe_id])
  end
  # def create
  #   @clothe = Clothe.find(params[:clothe_id])
  #   @favorite = Favorite.create(user_id: current_user.id, clothe_id: params[:clothe_id])
  #   @clothe.reload
  # end

  # def destroy
  #   @clothe = Clothe.find(params[:article_id])
  #   @favorite = Favorite.find_by(user_id: current_user.id, article_id: params[:article_id])
  #   @favorite.destroy
  #   @clothe.reload
    
  # end
end
