class AddUserRefToClothes < ActiveRecord::Migration[5.2]
  def change
    add_reference :clothes, :user, foreign_key: true
  end
end
