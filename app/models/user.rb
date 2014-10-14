class User < ActiveRecord::Base
  #Name validation
  validates :name, length: {in: 4..30}
  
  #Email validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  
  #Password validation and security
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  has_secure_password
  
  #Processing before save
  before_save { |user| user.email = email.downcase}
end
