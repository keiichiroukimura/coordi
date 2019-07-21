require 'rails_helper'

RSpec.describe "ユーザー管理機能", type: :system, js: true do
  describe 'ユーザー登録' do
  
    before do
      FactoryBot.create(:user) 
      visit new_user_path
      fill_in 'メールアドレス', with: 't2@test.com'
      fill_in 'パスワード', with: '111111'
      fill_in '確認用パスワード', with: '111111'
    end
    it "ユーザー登録ができる" do 
      fill_in '名前', with: 'ユーザーA'
      click_on "アカウント作成"
      expect(page).to have_content '投稿作成' 
    end
    # it '新規作成画面で名称を入力しなかった時、エラーとなる' do
    #   fill_in '名前', with: ''
    #   click_button 'アカウント作成'
    #   within '#error_explanation' do
    #     expect(page).to have_content '名前を入力してください'
    #   end
    # end
    # describe 'ログイン機能のテスト' do
    #   before do
    #     visit new_session_path
    #   end
    #   it "loginできる" do 
    #     fill_in 'Email', with: 't12@test.com'
    #     fill_in 'Password', with: '111111'
    #     click_on "Log in"
    #     expect(page).to have_content '投稿作成'
    #   end
    #   it "メールアドレスが違うとloginできない" do 
    #     fill_in 'Email', with: 't2@test.com'
    #     fill_in 'Password', with: '111111'
    #     click_on "Log in"
    #     expect(page).to have_content 'Emailアドレス、パスワードをもう一度確認し実行してください。'
    #   end
    # end
  end
end


