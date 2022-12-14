class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :specialization
      t.integer :phone
      t.string :email
      t.string :city
      t.text :bio
      t.text :photo

      t.timestamps
    end
  end
end
