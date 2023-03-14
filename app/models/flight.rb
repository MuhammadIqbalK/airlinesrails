class Flight < ApplicationRecord
    belongs_to :users, dependent: :destroy
    belongs_to :airline
    belongs_to :airport, class_name: "Airport", foreign_key: "airport_id"

    validates :departure_airport, presence: true
    validates :arrival_airport, presence: true
    validates :departure_time, presence: true
    validates :arrival_time, presence: true
    validates :price, presence: true
    validates :created_by, presence: true
  
    def new_attributes
    {
          id: self.id,
          departure_airport: self.departure_airport,
          arrival_airport: self.arrival_airport,
          departure_time: self.departure_time,
          arrival_time: self.arrival_time,
          airline_id: self.airline_id,
          price: self.price,
          created_by: self.created_by
      }
    end

end
