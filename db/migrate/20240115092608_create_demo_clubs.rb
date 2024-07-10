# frozen_string_literal: true

class CreateDemoClubs < ActiveRecord::Migration[7.1]
  def change
    create_table :demo_clubs do |t|
      t.string :name

      t.timestamps
    end
  end
end
