# frozen_string_literal: true

FactoryBot.define do
  factory :demo_address, class: 'Demo::Address' do
    street { Faker::Address.street_name }
    city { Faker::Address.city }
    country { Faker::Address.country }
    postal_code { Faker::Address.zip_code }
  end
end
