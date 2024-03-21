# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/sign_in' do
    it 'renders the sign in page' do
      get new_user_session_path
      expect(response).to have_http_status(200)
      expect(response.body).to include('Sign in')
    end
  end

  describe 'POST /users/sign_in' do
    let(:user) { create(:user) }

    it 'signs in the user' do
      user = FactoryBot.create(:user)
      post user_session_path, params: { user: { email: user.email, password: user.password } }

      expect(response).to redirect_to(root_path)

      follow_redirect!
      expect(response.body).to include('Signed in successfully')
    end
  end

  describe 'GET demo/users' do
    let(:user) { create(:user) }

    it 'returns a success response' do
      sign_in user
      get demo_users_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(user.full_name)
    end
  end

  describe 'GET demo/user/:id ' do
    let(:user) { create(:user) }

    it 'returns a success response' do
      sign_in user
      get demo_user_path(user)
      expect(response).to have_http_status(200)
      # expect(response.body).to include(user.email)
      # expect(response.body).to include(user.full_name)
    end
  end
end
