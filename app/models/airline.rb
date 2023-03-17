class Airline < ApplicationRecord
    has_many :flights

    validates :name, presence: true, length: { maximum: 200 }
    validates :code, presence: true, length: { maximum: 200 }, uniqueness: true
    
    
    def new_attributes
      {
        id: self.id,
        name: self.name,
        code: self.code
      }
      
    end

end
