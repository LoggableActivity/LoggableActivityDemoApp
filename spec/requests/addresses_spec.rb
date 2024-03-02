# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Demo::Adress', type: :request do
  describe 'GET /demo/addresses' do
    let(:user) { create(:user) }
    # let(addresses) {create_list(:demo_address, 5)}

    it 'show a list of addresses' do
      sign_in user
      Thread.current[:current_user] = user
      create_list(:demo_address, 5)
      # get demo_city_addresses_path()
      # expect(response).to have_http_status(200)
      expect(true).to be_falsey
    end
  end

  describe 'POST /demo/addresse/:id' do
    let(:user) { create(:user) }

    it 'creates a new address' do
      sign_in user
      Thread.current[:current_user] = user
      # post demo_addresses_path, params: { demo_address: attributes_for(:demo_address) }
      # follow_redirect!
      # expect(response.body).to include('Address was successfully created.')
      expect(true).to be_falsey
    end
  end
end
