FactoryBot.define do
  factory :user do
    nickname  {Faker::Name.name}
    email     {Faker::Internet.free_email}
    password  { 'abc123' }
  end
end