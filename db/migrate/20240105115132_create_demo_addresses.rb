# frozen_string_literal: true

class CreateDemoAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :demo_addresses do |t|
      t.string :street
      t.string :city
      t.string :postal_code
    end
    # add_reference :users, :address, foreign_key: { to_table: :demo_addresses }
  end
end
