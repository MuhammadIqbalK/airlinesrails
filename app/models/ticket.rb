class Ticket < ApplicationRecord
    belongs_to :flight
    belongs_to :user
  
    # scope :join_flight, -> { joins(:flight) }
    # scope :by_customer, ->( current_user) { join_flight.where(flight: { customer_id: current_user.id }) }
    # scope :_detail, ->(app, current_user) { by_customer(current_user).where(id: app.id) }

    # validates :total_passenger, presence: true
    # validates :price, presence: true, length: { maximum: 200 }    
    
    def new_attributes
      {
        id: self.id,
        total_passenger: self.total_passenger,
        price: self.flight.price,
        flight_id: self.flight_id,
        user_id: self.user.new_attributes
      }
      
    end

end
