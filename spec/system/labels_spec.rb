require 'rails_helper'

RSpec.describe "ラベル", type: :system do  
  before do
    user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'testA@t.com')
    FactoryBot.create(:clothe, user: user_a)
    FactoryBot.create(:second_clothe, user: user_a)
    FactoryBot.create(:label)
    FactoryBot.create(:second_label)
    visit new_session_path
    fill_in 'session_email', with: 'testA@t.com'
    fill_in 'session_password', with: '111111'
    click_on "ログイン"
  end
  describe 'ラベルを添付して投稿ができる' do
    before do 
      click_on "投稿作成"
      attach_file "clothe[image_first]", "#{Rails.root}/spec/fixtures/sample1.png"
      select '〜150cm', from: 'clothe_height'
      select 'girl', from: 'clothe_gender'
      check '雪遊び'
      fill_in 'new_content', with: 'testlabel'
      click_button "確認"
    end
    it 'ラベルを添付して投稿ができる' do
      click_button "投稿"
      expect(page).to have_content '〜150cm'
      expect(page).to have_content 'testlabel'
      expect(page).to have_content '雪遊び'
      expect(page).to have_xpath("//img[contains(@src,'sample1.png')]")
    end
    it 'ラベル検索ができる' do
      click_button "投稿"
      select '雪遊び', from: 'label_id'
      click_on '検索'
      expect(page).to have_content '雪遊び'
      expect(page).to have_content '1件の投稿が表示されています'
    end
  end
end