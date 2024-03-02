class CreateDemoCities < ActiveRecord::Migration[7.1]
  def change
    
    create_table :demo_cities do |t|
      t.string :name
      t.string :country

      t.timestamps
    end
    
    remove_column :demo_addresses, :city, :string
    add_reference :demo_addresses, :demo_city, null: true, foreign_key: true
  end
end
