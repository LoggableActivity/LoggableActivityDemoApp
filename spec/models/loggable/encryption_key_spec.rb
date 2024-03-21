# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoggableActivity::EncryptionKey, type: :model do
  describe '.for_record_by_type_and_id' do
    it 'returns an existing encryption key or creates a new one' do
      parent_key = create(:loggable_encryption_key)
      user = create(:user)

      ap LoggableActivity::EncryptionKey.for_record(user, parent_key)

      # expect(encryption_key.record).to eq(user)
      # expect(encryption_key.parent_key).to eq(parent_key)
    end
  end

  describe '.for_record' do
    it 'returns an existing encryption key or creates a new one' do
      record = create(:demo_address)
      parent_key = create(:loggable_encryption_key)

      encryption_key = LoggableActivity::EncryptionKey.for_record(record, parent_key)

      expect(encryption_key.record).to eq(record)
      expect(encryption_key.parent_key).to eq(parent_key)
    end
  end

  describe '.create_encryption_key' do
    it 'creates a new encryption key with a random key' do
      address = create(:demo_address)
      parent_key = create(:loggable_encryption_key, record: address)
      user = create(:user)

      encryption_key = LoggableActivity::EncryptionKey.for_record(user, parent_key)

      expect(encryption_key.record).to eq(user)
      expect(encryption_key.parent_key.record).to eq(address)
      expect(encryption_key.key).to be_a(String)
      expect(encryption_key.key.length).to eq(44)
    end
  end
end
