# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.text :bio
      t.integer :user_type, default: 0
    end
  end
end
