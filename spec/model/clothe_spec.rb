require 'rails_helper'

RSpec.describe Clothe, type: :model do
  describe "Clotheモデルテスト" do
    describe "投稿の新規作成" do

      context "成功する" do
        it "clothe, user_idが存在すれば有効" do
          user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'testA@t.com')
          clothe = FactoryBot.create(:clothe, user: user_a)
          expect(clothe).to be_valid
        end
      end

      context "失敗を期待する" do

        it "1枚目の画像がが空だと無効" do
          clothe = Clothe.new(image_first: "")
          expect(clothe).not_to be_valid
        end

        it "genderが空だと無効" do
          clothe = Clothe.new(gender: "")
          expect(clothe).not_to be_valid
        end

        it "heightが空だと無効" do
          clothe = Clothe.new(height: "")
          expect(clothe).not_to be_valid
        end

        it "contentが350文字以上だと無効" do
          clothe = Clothe.new(content: "a" * 351)
          expect(clothe).not_to be_valid
        end

      end
    end
  end
end