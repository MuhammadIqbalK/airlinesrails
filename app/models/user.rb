class User < ApplicationRecord

# belongs_to :role
has_secure_password
  
# belongs_to :department, dependent: :destroy
# has_many :appointments

# has_many :schedules

validates :name, presence: true, length: { maximum: 50 }
validates :email, presence: true, length: { maximum: 255 },
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                  uniqueness: true
# validates :specialization, length: { maximum: 50}
validates :contact, presence: true, length: {  maximum: 16 },
                          format: { with: /\A[0-9]+\z/ },
                          uniqueness: true
validates :role, presence: true
validates :gender, presence: true

enum role: {
  admin: 1,
  customer: 2
}

enum gender: {
    male: 1,
    female: 2
}

def new_attributes
{
      id: self.id,
      name: self.name,
      email: self.email,
      contact: self.contact,
      gender: self.gender,

      role: self.role,
      created_at: self.created_at
  }
end
end
