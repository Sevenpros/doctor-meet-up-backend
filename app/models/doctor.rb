class Doctor < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :specialization, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :city, presence: true
  validates :bio, presence: true
end
