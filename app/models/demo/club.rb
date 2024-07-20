# frozen_string_literal: true

module Demo
  class Club < ApplicationRecord
    include LoggableActivity::Hooks
    has_many :users, foreign_key: :demo_club_id, dependent: :nullify, inverse_of: :demo_club
    belongs_to :demo_address, class_name: 'Demo::Address', optional: true, inverse_of: :clubs

    validates :name, presence: true
  end
end
