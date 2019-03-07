FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Ethereum.address }
    first_name { Faker::Superhero.prefix }
    last_name { Faker::BackToTheFuture.character }
  end
end