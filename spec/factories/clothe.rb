FactoryBot.define do
  factory :clothe do
    image_first { File.open("#{Rails.root}/spec/fixtures/sample1.png",) }
    image_second { File.open("#{Rails.root}/spec/fixtures/sample2.png",) }
    image_third { File.open("#{Rails.root}/spec/fixtures/sample3.png",) }
    gender {"girl"}
    height { "〜80cm" }
    content { "テストA" }
  end
  factory :second_clothe, class: Clothe do
    image_first { File.open("#{Rails.root}/spec/fixtures/sample1.png",) }
    gender {"boy"}
    height { "〜90cm" }
    content { "テストB" }
  end
end