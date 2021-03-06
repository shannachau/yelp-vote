class User < ActiveRecord::Base
  # Validations
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  # Associations
  has_secure_password
  has_and_belongs_to_many :messages
  has_many :entries


end
