# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoggableActivity::Payload do
  describe 'validations' do
    let(:activity) { build(:loggable_activity) }

    it 'is valid with valid attributes and a valid activity' do
      record = create(:user)
      encrypted_attrs = { key: 'value' }.to_json
      payload = described_class.new(record:, encrypted_attrs:, activity:)
      expect(payload).to be_valid
    end

    # it 'is invalid without an record' do
    #   attrs = { key: "value"}.to_json
    #   payload = Loggable::Payload.new(attrs: attrs , activity: activity)
    #   payload.valid?
    #   expect(payload.errors[:record]).to include("can't be blank")
    # end

    it 'is invalid without attrs' do
      record = create(:user)
      payload = described_class.new(record:, activity:)
      payload.valid?
      expect(payload.errors[:encrypted_attrs]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it 'belongs to an activity' do
      payload = described_class.reflect_on_association(:activity)
      expect(payload.macro).to eq(:belongs_to)
    end
  end
end
