class User < ApplicationRecord
  has_many :bookings
  has_many :doctors, through: :bookings
end
