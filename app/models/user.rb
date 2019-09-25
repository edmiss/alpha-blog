class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  has_many :articles 

  before_save {
    self.email = email.downcase
}

  validates :username, presence: true, uniqueness: true,
   length: { mininum: 3, maximum: 25 }
  validates :email, presence: true, uniqueness: true,
   length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
end