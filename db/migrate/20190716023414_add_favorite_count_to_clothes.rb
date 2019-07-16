class AddFavoriteCountToClothes < ActiveRecord::Migration[5.2]
  def change
    add_column :clothes, :favorite_count, :integer
  end
end
