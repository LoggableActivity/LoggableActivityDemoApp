# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Demo::City do
  it 'has a valid factory' do
    expect(build(:demo_city)).to be_valid
  end

  it 'is invalid without a name' do
    demo_city = build(:demo_city, name: nil)
    demo_city.valid?
    expect(demo_city.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a country' do
    demo_city = build(:demo_city, country: nil)
    demo_city.valid?
    expect(demo_city.errors[:country]).to include("can't be blank")
  end
end
