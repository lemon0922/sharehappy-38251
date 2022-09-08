FactoryBot.define do
  factory :event do
    title      { 'テスト' }
    start_time {Faker::Date.forward(50)}
    content    {Faker::Lorem.sentence}
    association :user
  end
end