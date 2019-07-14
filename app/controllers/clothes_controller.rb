class ClothesController < ApplicationController
  def new
    if params[:back]
      @clothe = Clothe.new(post_params)
    else
      @clothe = Clothe.new
    end
  end

  def index
    @clothes = Clothe.all.order(created_at: "DESC") 
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

  private

  def clothe_params
    params.require(:clothe).permit(:image_first, :image_second, :image_third, 
                                   :image_cache, :gender, :height, :content, :user_id)
  end

end
