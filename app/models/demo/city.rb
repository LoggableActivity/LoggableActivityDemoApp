# frozen_string_literal: true

module Demo
  class City < ApplicationRecord
    include LoggableActivity::Hooks
    has_many :demo_addresses, class_name: 'Demo::Address', inverse_of: :demo_city, dependent: :nullify
    accepts_nested_attributes_for :demo_addresses
    has_many :users, through: :demo_addresses

    validates :name, presence: true
    validates :country, presence: true

    def inhabitants
      users
    end

    def population
      inhabitants.count
    end
  end
end
