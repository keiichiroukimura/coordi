class Clothe < ApplicationRecord
  belongs_to :user
  enum gender: {girl: 0,boy: 1}
  enum height: {〜80cm: 0, 〜90cm: 1, 〜100cm: 2,  〜110cm: 3, 〜120cm: 4, 〜130cm: 5, 〜140cm: 6, 〜150cm: 7 }
  mount_uploader :image_first, ImageUploader
  mount_uploader :image_second, ImageUploader
  mount_uploader :image_third, ImageUploader
end
