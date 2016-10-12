FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      n.to_s + Faker::Internet.email
    end
    name { Faker::Name.name }
  end
end
