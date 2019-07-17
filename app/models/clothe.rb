class Clothe < ApplicationRecord
  belongs_to :user
  has_many :clothe_labels, dependent: :destroy
  has_many :labels, through: :clothe_labels, source: :label
  has_many :favorites, dependent: :destroy
  enum gender: {girl: 0,boy: 1}
  enum height: {〜80cm: 0, 〜90cm: 1, 〜100cm: 2,  〜110cm: 3, 〜120cm: 4, 〜130cm: 5, 〜140cm: 6, 〜150cm: 7 }
  
  mount_uploader :image_first, ImageUploader
  mount_uploader :image_second, ImageUploader
  mount_uploader :image_third, ImageUploader
  
  scope :search_height, ->(height) {
    return if height.blank? 
    where(height: height)
  }
  scope :search_gender, ->(gender) {
    return if gender.blank?
    where(gender: gender)
  }
  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end
end
