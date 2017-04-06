FactoryGirl.define do
  factory :user do
    name { Faker::Pokemon.name }
    email { Faker::Internet.email }
    password 'foobar'
  end
end
