class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :total_passenger
      t.integer :price
      t.integer :flight_id
      t.integer :user_id
      t.timestamps
    end
  end
end
