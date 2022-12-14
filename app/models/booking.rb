class Booking < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  validates :date, presence: true
  validates :time, presence: true
  validates :city, presence: true
  validates :disease_desc, presence: true
end
