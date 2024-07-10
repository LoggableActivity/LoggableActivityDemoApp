# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index.html.slim' do
  context 'when user is signed in' do
    before do
      user = instance_double(User, email: 'user@example.com')
      allow(view).to receive_messages(user_signed_in?: true, current_user: user)
    end

    it 'displays a sign out link and the user email' do
      render partial: 'shared/session'
      expect(rendered).to include 'user@example.com'
    end
  end

  context 'when user is not signed in' do
    before do
      allow(view).to receive(:user_signed_in?).and_return(false)
    end

    it 'displays a sign in link' do
      render partial: 'shared/session'
      expect(rendered).to have_link('Sign in', href: new_user_session_path, class: 'btn btn-outline-secondary')
    end
  end
end
