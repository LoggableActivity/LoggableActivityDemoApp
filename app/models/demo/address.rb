# frozen_string_literal: true

module Demo
  class Address < ApplicationRecord
    include LoggableActivity::Hooks
    has_many :users, foreign_key: :demo_address_id, dependent: :nullify
    has_many :clubs, foreign_key: :demo_address_id, dependent: :nullify
    # belongs_to :demo_city, class_name: 'Demo::City', inverse_of: :demo_addresses
    belongs_to :demo_city, class_name: 'Demo::City', inverse_of: :demo_addresses, optional: false

    validates :street, presence: true

    def full_address
      "#{street} #{city}, #{country} #{postal_code}"
    end
  end
end
