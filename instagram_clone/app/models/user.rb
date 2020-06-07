class User < ApplicationRecord
  has_many :pictures

  has_secure_password
  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username, :email
  validates_length_of :username, :maximum => 20
  validates_length_of :password, :minimum => 6
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
