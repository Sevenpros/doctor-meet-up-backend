class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.text :time
      t.string :city
      t.text :disease_desc

      t.timestamps
    end
  end
end
