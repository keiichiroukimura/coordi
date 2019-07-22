FactoryBot.define do
  factory :user do
    name { "テストA" }
    email { "t@test.com" }
    password { "111111" }
  end
  factory :second_user, class: User do
    name { "テストB" }
    email { "tB@test.com" }
    password { "111111" }
  end
end
