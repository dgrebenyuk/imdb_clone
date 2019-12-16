# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'Password1' }
    password_confirmation { 'Password1' }
  end

  factory :movie do
    title { Faker::Movie.quote }
    description { Faker::Lorem.paragraph }
  end

  factory :rating do
    user
    movie
    value { rand(1..10) }
  end
end
