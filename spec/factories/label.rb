FactoryBot.define do
  factory :label do
    content { "雪遊び" }
  end
  factory :second_label, class: Label do
    content { "スポーツ" }
  end
end