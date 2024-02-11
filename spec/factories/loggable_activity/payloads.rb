# frozen_string_literal: true

FactoryBot.define do
  factory :loggable_payload, class: 'LoggableActivity::Payload' do
    owner { '' }
    encrypted_attrs { '' }
    activity { nil }
  end
end
