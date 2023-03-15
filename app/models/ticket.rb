class Ticket < ApplicationRecord
    belongs_to :flight
    belongs_to :user
  
    validates :total_passenger, presence: true
    validates :price, presence: true, length: { maximum: 200 }    
    
    def new_attributes
      {
        id: self.id,
        total_passenger: self.total_passenger,
        price: self.flight.price,
        flight_id: self.flight_id,
        user_id: self.user_id
      }
      
    end

end
