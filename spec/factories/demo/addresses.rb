# frozen_string_literal: true

FactoryBot.define do
  factory :demo_address, class: 'Demo::Address' do
    street { Faker::Address.street_name }
    postal_code { Faker::Address.zip_code }
    demo_city factory: %i[demo_city]
  end
end
