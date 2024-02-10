# frozen_string_literal: true

class CreateDemoJournals < ActiveRecord::Migration[7.1]
  def change
    create_table :demo_journals do |t|
      t.string :title
      t.text :body
      t.integer :state, default: 0

      t.references :patient, foreign_key: { to_table: :users }, null: true
      t.references :doctor, foreign_key: { to_table: :users }, null: true

      t.timestamps
    end
  end
end
