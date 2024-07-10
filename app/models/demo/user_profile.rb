# frozen_string_literal: true

module Demo
  class UserProfile < ApplicationRecord
    include LoggableActivity::Hooks
    belongs_to :user, class_name: 'User', optional: true
  end
end
