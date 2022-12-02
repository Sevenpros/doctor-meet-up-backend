class AddDoctorRefToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :doctor, null: false, foreign_key: true
  end
end
