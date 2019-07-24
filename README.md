# README

## アプリ名: coordi(コーディ)
## 概要
kids,babyのコーディネート投稿アプリ。投稿は写真（1投稿3カット）性別、身長、お出かけシーンを
<br>登録、検索することができます。いいね機能が有り、お気に入りの投稿はいいね一覧でストックとして<br>
確認することができます。

## 開発環境
Ruby 2.6.3 Rails 2.5.3 Bundler 2.0.2

## 機能一覧
### ユーザー管理機能
- ログイン機能<br>
- ユーザー登録機能<br>
  ・名前、メールアドレス、パスワード登録 <br>
### 投稿機能
- コーディネート一覧表示<br>
  ・一覧表示から「いいね」追加と投稿詳細表示<br>
- コーディネート登録<br>
  ・写真３カットまで、コメント、身長、性別、お出かけシーン<br>
- コーディネート編集、削除<br>
  ・マイページに自身の投稿一覧を表示。編集、削除ができます。<br>
- ユーザー投稿一覧確認<br>
  ・投稿一覧のユーザーの名前をクリックすると、そのユーザーの投稿一覧を確認できます<br>
### いいね機能 Ajax(非同期通信)
- 投稿に対して「いいね」ができます。<br>
  ・いいね一覧ページで自分のいいねした投稿を確認できます。

## カタログ設計
https://docs.google.com/spreadsheets/d/1t6hIbrmdhnemDtzLA69vEhaRdsj7OvWi5xhH53mkzoE/edit#gid=0
## テーブル設計
https://docs.google.com/spreadsheets/d/1t6hIbrmdhnemDtzLA69vEhaRdsj7OvWi5xhH53mkzoE/edit#gid=912441610
## ER図
https://docs.google.com/spreadsheets/d/1t6hIbrmdhnemDtzLA69vEhaRdsj7OvWi5xhH53mkzoE/edit#gid=217079134
## 画面遷移図
https://docs.google.com/spreadsheets/d/1t6hIbrmdhnemDtzLA69vEhaRdsj7OvWi5xhH53mkzoE/edit#gid=477357645
## 使用gem一部
・kaminari<br>
・carrierwave<br>
・mini_magick





