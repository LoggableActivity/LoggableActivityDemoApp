# frozen_string_literal: true

module Demo
  class Address < ApplicationRecord
    include LoggableActivity::Hooks
    has_many :users, foreign_key: :demo_address_id, dependent: :nullify, inverse_of: :demo_address
    has_many :clubs, foreign_key: :demo_address_id, dependent: :nullify, inverse_of: :demo_club
    belongs_to :demo_city, class_name: 'Demo::City', inverse_of: :demo_addresses, optional: true

    # validates :demo_city, presence: true
    validates :street, presence: true

    def full_address
      address = "#{street} #{postal_code}"
      address + " - #{demo_city.name}" if demo_city
    end
  end
end
