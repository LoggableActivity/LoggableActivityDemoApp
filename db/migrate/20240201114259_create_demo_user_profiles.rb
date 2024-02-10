# frozen_string_literal: true

class CreateDemoUserProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :demo_user_profiles do |t|
      t.string :sex
      t.string :religion
      # t.references :user
      t.belongs_to :user, index: { unique: true }, foreign_key: true
    end
    # add_foreign_key :demo_user_profiles, :users, column: :user_id
  end
end
