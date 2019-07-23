class Clothe < ApplicationRecord
  validates :image_first,  presence: true
  validates :gender,  presence: true
  validates :height,  presence: true
  validates :content, length: { maximum: 350 }
  belongs_to :user
  has_many :clothe_labels, dependent: :destroy
  has_many :labels, through: :clothe_labels, source: :label
  has_many :favorites, dependent: :destroy
  enum gender: {girl: 0,boy: 1}
  enum height: {〜80cm: 0, 〜90cm: 1, 〜100cm: 2,  〜110cm: 3, 〜120cm: 4, 〜130cm: 5, 〜140cm: 6, 〜150cm: 7 }
  
  mount_uploader :image_first, ImageUploader
  mount_uploader :image_second, ImageUploader
  mount_uploader :image_third, ImageUploader
  
  scope :search_gender, ->(params) {
    return if params.blank?
    where(gender: params)
    
  }
  
  scope :search_height, ->(params) {
    return if params.blank? 
    where(height: params)
  }
  
  scope :search_label, ->(params) { 
    return if params.blank?
      joins(:labels).where(labels: {content: params}) 
      
  }
  
  scope :search_clothes, -> (params) do
    if params[:search].present?
       search_gender(params[:gender])
      .search_height(params[:height])
      .search_label(params[:label_id])
    end
  end

  
  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end
end
