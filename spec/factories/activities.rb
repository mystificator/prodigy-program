FactoryBot.define do
  factory :activity do
    name { Faker::Hobby.activity }
    frequency { ["Maximize", "2x/Day", "1x/Day", "3x/Week", "2x/Week"].sample }
    duration { "#{rand(30..60)} sec" }
    category
  end
end
