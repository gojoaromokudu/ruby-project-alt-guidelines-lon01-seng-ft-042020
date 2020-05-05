class CreateWaiters < ActiveRecord::Migration[5.2]
  def change
    create_table :waiters do |t|
      t.string :name
      t.string :selling_style
      t.integer :section
    end
  end
end
