class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :clothe, counter_cache: :favorite_count
end
