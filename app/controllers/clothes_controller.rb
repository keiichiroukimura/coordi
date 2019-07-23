class ClothesController < ApplicationController
  before_action :set_clothe, only: [:show, :edit, :update, :destroy]
  PER = 12
  def new
    if params[:back]
      @clothe = Clothe.new(clothe_params)
    else
      @clothe = Clothe.new
    end
  end

  def index
    @clothes = Clothe.all.order(created_at: "DESC") 
    @searched_clothes = @clothes.search_clothes(params)
    @paged_clothes = @searched_clothes.page(params[:page]).per(PER)
    @favorite = Favorite.find_by(user_id: current_user.id, clothe_id: params[:id]) if logged_in?
    
  end
  
  def confirm
    @clothe = Clothe.new(clothe_params)
    @clothe.user_id = current_user.id
    render :new if @clothe.invalid?
  end

  def create
    @clothe = Clothe.new(clothe_params)
    @clothe.user_id = current_user.id
    if @clothe.save
      flash[:success] = "新規投稿。"
      redirect_to clothes_path
    else
      render 'new'
    end
  end
  
  def edit;end

  def update
    @clothe.user_id == current_user.id
    if @clothe.update(clothe_params)
      redirect_to clothes_path
    else
      render 'edit'
    end
  end 

  def show
  end	
  
  def destroy
    @clothe.destroy
    redirect_to user_path(@clothe.user_id), notice: '投稿を削除しました。'
  end

  private

  def clothe_params
    params.require(:clothe).permit(:id, :image_first, :image_second, :image_third, 
                                   :image_first_cache, :image_second_cache, :image_third_cache,
                                   :gender, :height, :content, :user_id, label_ids: [])
  end
  
  def set_clothe
    @clothe = Clothe.find(params[:id])
  end
end
