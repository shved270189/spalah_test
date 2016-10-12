FactoryGirl.define do
  factory :post do
    user
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.sentence }

    trait :without_title do
      title nil
    end

    trait :with_2_likes do
      likes { create_list(:user, 2).pluck(:id) }
    end
  end
end
