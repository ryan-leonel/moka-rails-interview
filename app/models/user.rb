class User < ActiveRecord::Base

  has_secure_password

  has_one :business

  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false } 
  validates :password, presence: true, length: { minimum: 6 }
end
