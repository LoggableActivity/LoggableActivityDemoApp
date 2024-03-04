# frozen_string_literal: true

FactoryBot.define do
  factory :demo_city, class: 'Demo::City' do
    name { Faker::Address.city }
    country { Faker::Address.country }
  end
end
