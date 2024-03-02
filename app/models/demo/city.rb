class Demo::City < ApplicationRecord
  has_many :demo_addresses, class_name: 'Demo::Address', inverse_of: :demo_city
  accepts_nested_attributes_for :demo_addresses
  has_many :users, through: :demo_addresses

  def inhabitants
    users
  end

  def population
    inhabitants.count
  end
end
