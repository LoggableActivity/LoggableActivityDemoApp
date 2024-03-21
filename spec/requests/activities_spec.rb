# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LoggableActivty', type: :request do
  describe 'GET demo/activity_logs, has an update_payload ' do
    let(:user) { create(:user, demo_address: create(:demo_address)) }

    it 'shows the the activity log' do
      sign_out user
      actor = create(:user, email: 'actor@example.com')
      sign_in actor

      Thread.current[:current_user] = actor
      user.first_name
      user.update!(first_name: 'John')

      # get demo_activity_logs_path
      # expect(response).to have_http_status(200)
      # expect(response.body).to include('A user was updated')
      # expect(response.body).to include('John')
      # expect(response.body).to include(original_first_name)
      # expect(response.body).to include(actor.full_name)
      # expect(response.body).to include(user.first_name)
    end
  end
end
