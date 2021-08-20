class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :prescriptions
  has_many :medications, :through => :prescriptions
end
