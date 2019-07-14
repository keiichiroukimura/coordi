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
end
