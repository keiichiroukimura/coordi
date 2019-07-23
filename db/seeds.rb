# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Label.create!(content: "海遊び")
Label.create!(content: "山遊び")
Label.create!(content: "雪遊び")
Label.create!(content: "スポーツ")
Label.create!(content: "公園")
Label.create!(content: "街中カジュアル")
Label.create!(content: "フォーマル")


User.create!(
  email: 'test1@test.com',
  password: '111111',
  name: 'test1',
)
User.create!(
  email: 'test2test.com',
  password: '111111',
  name: 'test2',
)
User.create!(
  email: 'test3@test.com',
  password: '111111',
  name: 'test3',
)
User.create!(
  email: 'test4@test.com',
  password: '111111',
  name: 'test4',
)

User.create!(
  email: 'test5@test.com',
  password: '111111',
  name: 'test5',
)
