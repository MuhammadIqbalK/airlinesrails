class Airport < ApplicationRecord
    # belongs_to :
    # belongs_to :
    has_one :flight

    validates :name, presence: true, length: { maximum: 200 }
    validates :city, presence: true, length: { maximum: 200 }
    
    
    def new_attributes
      {
        id: self.id,
        name: self.name,
        city: self.city
      }
      
    end

end
