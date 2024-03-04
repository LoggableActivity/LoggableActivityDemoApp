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
      get demo_addresses_path
      expect(response).to have_http_status(200)
      # expect(true).to be_falsey
    end
  end

  describe 'POST /demo/cities/:city_id/addresses' do
    let(:user) { create(:user) }
    let(:city) { create(:demo_city) }
    let(:address_attributes) { attributes_for(:demo_address, demo_city_id: city.id) }

    it 'creates a new address' do
      sign_in user
      Thread.current[:current_user] = user

      expect do
        post demo_city_demo_addresses_path(city_id: city.id), params: { demo_address: address_attributes }
      end.to change(Demo::Address, :count).by(1)

      expect(response).to redirect_to(demo_city_url(city))
      follow_redirect!
      expect(response.body).to include('Address was successfully created.')
    end
  end
end
