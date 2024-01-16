FactoryBot.define do
  factory :train do
    association :train_operator
    association :line
    capacity { Faker::Number.between(from: 50, to: 500) }
    cost { Faker::Number.between(from: 50, to: 200) }
    status { true }
    line_name { Faker::Lorem.word }
  end
end
