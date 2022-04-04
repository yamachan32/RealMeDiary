FactoryBot.define do
  factory :diary do
    diary_date { Faker::Date.backward }
    title { Faker::Lorem.word[0..14] }
    text { Faker::Lorem.sentence }

    association :user

    after(:build) do |diary|
      diary.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end