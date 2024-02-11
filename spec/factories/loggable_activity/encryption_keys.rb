# frozen_string_literal: true

FactoryBot.define do
  factory :loggable_encryption_key, class: 'LoggableActivity::EncryptionKey' do
    association :record, factory: :user
    # record_type { 'Demo::Addredd' }
    # record_id { SecureRandom.uuid }
    # parrent_key { SecureRandom.uuid }
    key { SecureRandom.hex(16) }
  end
end
