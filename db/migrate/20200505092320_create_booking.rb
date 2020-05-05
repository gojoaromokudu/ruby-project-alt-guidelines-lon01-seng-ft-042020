class CreateBooking < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :waiter_id
      t.integer :host_id
      t.string :day
      t.integer :sub_total
      t.integer :service_charge
      t.integer :total
      t.integer :avg_per_head
    end
  end
end
