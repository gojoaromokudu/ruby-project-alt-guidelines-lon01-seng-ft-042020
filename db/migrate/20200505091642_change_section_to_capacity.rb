class ChangeSectionToCapacity < ActiveRecord::Migration[5.2]
  def change
    change_table :waiters do |t|
      t.rename :section, :capacity
    end
  end
end
