class Medication < ApplicationRecord
  has_many :medication_users
  has_many :users, :through => :medication_users
end