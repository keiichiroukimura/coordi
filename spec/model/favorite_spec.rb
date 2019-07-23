require 'rails_helper'

RSpec.describe "Fvorite", type: :model do

  let!(:user) {FactoryBot.create(:user)}
  let!(:clothe) {FactoryBot.create(:clothe, user: user )}
    
    it "いいね機能の中間テーブルへ保存" do
      favorite = Favorite.create!(user_id: user.id, clothe_id: clothe.id)
      expect(favorite).to be_valid
    end

    it "ユーザーと投稿が重複した場合、無効" do
      Favorite.create!(user_id: user.id, clothe_id: clothe.id)
      favorite_2 = Favorite.new(user_id: user.id, clothe_id: clothe.id)
      expect(favorite_2).to be_valid
    end
end
