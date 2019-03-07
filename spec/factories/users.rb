FactoryBot.define do
  factory :user do
    first_name { Faker::Superhero.prefix }
    last_name { Faker::BackToTheFuture.character }
    email { Faker::Internet.email }
    password { Faker::Ethereum.address }
  end
end
