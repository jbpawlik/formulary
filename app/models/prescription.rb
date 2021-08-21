class Prescription < ApplicationRecord
  belongs_to :user
  belongs_to :medication
  # validates :user_id, presence: true
  # validates :medication_id, presence: true
end