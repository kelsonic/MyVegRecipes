class Chef < ActiveRecord::Base
  has_many :likes
  has_many :recipes
  
  before_save { self.chefname = chefname }
  before_save { self.email = email.downcase }
  
  validates :chefname, presence: true, length: { minimum: 2, maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
  
end