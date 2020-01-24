# README

## アプリ名: coordi(コーディ)
## アプリについて
#### 目的
お出かけシーン別検索を利用し普段自分では思いつかないコーディネート、<br>
アイテムを発見することを目的としています。
#### 概要

・お出かけシーン、性別、身⻑別で kids,baby のコーディネートが投稿できるアプリです。<br>
・お出かけシーンは変更、削除可能です。<br>
・性別、身⻑、お出かけシーンでそれぞれ組み合わせ検索が可能です。<br> 
・1回の投稿で写真は 3 カットまで投稿できます。2 枚目以降の写真は投稿の詳細画面で見ることができます。<br>
・ハートの「いいね」はログインでクリックすることができます。自分の投稿に「いいね」はできません。 <br>
・投稿のお名前をクリックでその人の投稿一覧が見れます。 <br>
・マイページから投稿の編集、削除ができます。
## 開発環境
Ruby 2.6.3<br> Rails 2.5.3<br> Bundler 2.0.2
## インフラ
デプロイ：Heroku<br>
画像アップロード先：S3<br>

## 機能一覧
### ユーザー管理機能
- ログイン機能<br>
- ユーザー登録機能<br>
  ・名前、メールアドレス、パスワード登録 <br>
### 投稿機能
- 投稿一覧表示<br>
  ・一覧表示から「いいね」追加と投稿詳細表示<br>
- 投稿登録<br>
  ・写真３カットまで、コメント、身長、性別、お出かけシーン<br>
- 投稿編集、削除<br>
  ・マイページに自身の投稿一覧を表示。編集、削除ができます。<br>
- ユーザー投稿一覧確認<br>
  ・投稿一覧のユーザーの名前をクリックすると、そのユーザーの投稿一覧を確認できます<br>
### 検索機能
- 投稿一覧から検索<br>
  ・性別、身長、お出かけシーン別、または組み合わせで検索ができます<br>
### いいね機能 (Ajax)
- 投稿に対して「いいね」ができます。<br>
  ・ハートクリックでいいねができます。いいね一覧ページで自分のいいねした投稿を確認できます。
### レスポンシブ対応
- スマホ用ハンバーガーメニューの実装。<br>
### ページネーション
- 投稿一覧画面のpagenation
### Rspecの実装(テスト)
  ・system spec
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





