# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoggableActivity::EncryptionKey, type: :model do
  describe '#mark_as_deleted' do
    it 'updates the key to nil and recursively marks parent key as deleted' do
      user = create(:user)
      parent_key = create(:loggable_encryption_key, record: user)
      user2 = create(:user)
      encryption_key = create(:loggable_encryption_key, record: user2, parrent_key: parent_key)

      expect do
        encryption_key.mark_as_deleted
      end.to change { encryption_key.reload.key }.to(be_nil)

      expect(parent_key.reload.key).to eq(nil)
    end
  end

  describe '.for_record_by_type_and_id' do
    it 'returns an existing encryption key or creates a new one' do
      parrent_key = create(:loggable_encryption_key)
      user = create(:user)

      encryption_key =
        LoggableActivity::EncryptionKey.for_record(user, parrent_key)

      expect(encryption_key.record).to eq(user)
      expect(encryption_key.parrent_key).to eq(parrent_key)
    end
  end

  describe '.for_record' do
    it 'returns an existing encryption key or creates a new one' do
      record = create(:demo_address)
      parrent_key = create(:loggable_encryption_key)

      encryption_key = LoggableActivity::EncryptionKey.for_record(record, parrent_key)

      expect(encryption_key.record).to eq(record)
      expect(encryption_key.parrent_key).to eq(parrent_key)
    end
  end

  describe '.create_encryption_key' do
    it 'creates a new encryption key with a random key' do
      
      address = create(:demo_address)
      parrent_key = create(:loggable_encryption_key, record: address)
      user = create(:user)

      encryption_key = LoggableActivity::EncryptionKey.for_record(user, parrent_key)

      expect(encryption_key.record).to eq(user)
      expect(encryption_key.parrent_key.record).to eq(address)
      expect(encryption_key.key).to be_a(String)
      expect(encryption_key.key.length).to eq(32) # 16 bytes
    end
  end
end
