require 'rails_helper'

RSpec.describe "ユーザー管理機能", type: :system, js: true do
  before do
  FactoryBot.create(:user)
  end
  
  describe 'ユーザー登録' do
    before do
      
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
    it '新規作成画面で名称を入力しなかった時、エラーとなる' do
      fill_in '名前', with: ''
      click_button 'アカウント作成'
      within '#error_explanation' do
        expect(page).to have_content '名前を入力してください'
      end
    end
  end  

  describe 'ログイン機能のテスト' do
    before do
      visit new_session_path
      fill_in 'session_email', with: 't@test.com'
      fill_in 'session_password', with: '111111'
      click_on "ログイン"
    end
      it "ログインできる" do 
        expect(page).to have_content '投稿作成'
      end
      it 'ログイン後遷移のテスト' do
        click_on 'マイページ'
        expect(page).to have_content 'さんの投稿一覧'
        click_on 'いいね一覧'
        expect(page).to have_content 'さんのいいね一覧'
      end
  end

  describe 'ログインできない' do
    it "メールアドレスが違うとログインできない" do 
      visit new_session_path
      fill_in 'session_email', with: 't3@test.com'
      fill_in 'session_password', with: '111111'
      click_on "ログイン"
      expect(page).to have_content 'Emailアドレス、パスワードをもう一度確認し実行してください。'
    end
  end
end


