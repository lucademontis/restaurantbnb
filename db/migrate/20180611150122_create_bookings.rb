class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.integer :total_price
      t.string :status
      t.integer :number_of_people
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
