FactoryGirl.define do
  factory :item do
    name { Faker::StarWars.character }
    done false
    todo_id 1
  end
end
