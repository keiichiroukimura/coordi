require "rails_helper"

RSpec.describe User, type: :model do
  
  describe 'name登録時のバリデーション' do
    
    it 'nameが空なら無効' do
      user = FactoryBot.build(:user, name: '')
      expect(user).not_to be_valid
    end
    
    it 'nameが30文字以上だと無効' do
      user = FactoryBot.build(:user, name: 'あ' * 31)
      expect(user).not_to be_valid
    end
  
    it 'emailが空だと無効' do
      email = FactoryBot.build(:user, email: '')
      expect(email).not_to be_valid
    end

    it 'emailが255文字以上だと無効' do
      email = FactoryBot.build(:user, email: 'a' * 247 + '@test.com')
      expect(email).not_to be_valid
    end

    it 'emailに@表記が無いと無効' do
      email = FactoryBot.build(:user, email: 'qwertyuiop')
      expect(email).not_to be_valid
    end

    it 'passwordが空だと無効' do
      password = FactoryBot.build(:user, password: '')
      expect(password).not_to be_valid
    end
    
    it 'password_confirmaitionが空だと無効' do
      password = FactoryBot.build(:user, password_confirmation: '')
      expect(password).not_to be_valid
    end

    it 'passwordの入力欄と確認欄が違うと無効' do
      password = FactoryBot.build(:user, password: '111111',password_confirmation: '222222')
      expect(password).not_to be_valid
    end
  end
end