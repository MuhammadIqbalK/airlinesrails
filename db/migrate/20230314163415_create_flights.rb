class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :departure_airport
      t.integer :arrival_airport
      t.datetime :departure_time
      t.datetime :arrival_time
      t.integer :price
      t.integer :create_table
      t.timestamps
    end
  end
end
