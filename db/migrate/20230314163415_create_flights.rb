class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :departure_airport
      t.integer :arrival_airport
      t.datetime :departure_time
      t.datetime :arrival_time
      t.integer :price
      t.integer :airline_id
      t.integer :capacity
      t.integer :created_by
      t.timestamps
    end
  end
end
