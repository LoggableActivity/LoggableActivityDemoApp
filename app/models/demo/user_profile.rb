# frozen_string_literal: true

module Demo
  class UserProfile < ApplicationRecord
    include LoggableActivity::Hooks
    belongs_to :user, class_name: 'User', foreign_key: :user_id, optional: true
  end
end
