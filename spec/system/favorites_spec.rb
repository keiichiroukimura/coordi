require 'rails_helper'

RSpec.describe "気に入り機能", type: :system do  
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
  it 'いいねボタン押下時のカウント数の増減' do
    # find('#favorite_button').click
    # expect(page).to have_selector
    # expect(Favorite.count).to eq 1
    expect {
      page.first("#favorite_button").click
      sleep 0.5
    }.to change { Favorite.count }.by(1)
    expect {
      page.first("#unfavorite_button").click
      sleep 0.5
    }.to change { Favorite.count }.by(-1)
  end
  
end