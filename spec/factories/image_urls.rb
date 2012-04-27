FactoryGirl.define do
  factory :image_url do
    board_thread
    sequence(:url) { |n| "http://imepic.jp/2000000/#{n}" }
    sequence(:body) { |n| "honbun http://imepic.jp/2000000/#{n}" }
    writer 'Anonymous'
    uploader_type 'imepic'
    accessed_at nil
    finished false

    trait :finished do
      accessed_at { Time.now }
      finished true
    end

    trait :accessed do
      accessed_at { Time.now - 3.hours }
    end
  end
end
