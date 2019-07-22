require 'rails_helper'

RSpec.describe "投稿", type: :system do  
  before do
    user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'testA@t.com')
    user_b = FactoryBot.create(:user, name: 'ユーザーB', email: 'testB@t.com')
    FactoryBot.create(:clothe, user: user_a)
    FactoryBot.create(:second_clothe, user: user_b)
    visit new_session_path
    fill_in 'session_email', with: 'testA@t.com'
    fill_in 'session_password', with: '111111'
    click_on "ログイン"
  end
  
  describe '画像投稿ができる' do
    before do 
      click_on "投稿作成"
      attach_file "clothe[image_first]", "#{Rails.root}/spec/fixtures/sample1.png"
      fill_in 'new_content', with: 'testtesttest'
      click_button "確認"
    end
    it '投稿の確認画面遷移テスト' do
      expect(page).to have_content '確認画面'
      expect(page).to have_content '〜80cm'
      expect(page).to have_content 'girl'
      expect(page).to have_content 'testtesttest'
      expect(page).to have_xpath("//img[contains(@src,'sample1.png')]")
    end
    it '投稿ができる' do
      click_button "投稿"
      expect(page).to have_content '〜80cm'
      expect(page).to have_content 'testtesttest'
      expect(page).to have_xpath("//img[contains(@src,'sample1.png')]")
    end
    it 'コメントが空でも投稿ができる' do
      click_button "投稿"
      expect(page).to have_content '〜80cm'
      expect(page).to have_content ''
      expect(page).to have_xpath("//img[contains(@src,'sample1.png')]")
    end
    it '投稿をマイページで確認できる' do
      click_button "投稿"
      click_on "マイページ"
      expect(page).to have_content '〜80cm'
      expect(page).to have_content 'testtesttest'
      expect(page).to have_xpath("//img[contains(@src,'sample1.png')]")
    end
  end
  
  describe '画像投稿ができない' do
    it '１つめの画像が空だと投稿できない' do
      click_on "投稿作成"
      click_button "確認"
      attach_file "clothe[image_second]", "#{Rails.root}/spec/fixtures/sample2.png"
      attach_file "clothe[image_third]", "#{Rails.root}/spec/fixtures/sample3.png"
      expect(page).to have_content 'Image firstを入力してください'
    end
  end
  
  describe '投稿の削除と編集' do
    it '投稿の削除' do
      click_on "マイページ"
      click_on "Destroy"
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content '投稿を削除しました'
    end
    it '投稿の編集' do
      click_on "マイページ"
      click_on "Edit"
      fill_in 'new_content', with: 'testEdit'
      click_on "投稿"
      expect(page).to have_content 'testEdit'
    end
  end

  describe '検索機能のテスト' do
    it '身長による検索機能' do
      select '〜80cm', from: 'height'
      click_on '検索'
      expect(page).to have_content '〜80cm'
      expect(page).to have_content '1件の投稿が表示されています'
    end
  end
end