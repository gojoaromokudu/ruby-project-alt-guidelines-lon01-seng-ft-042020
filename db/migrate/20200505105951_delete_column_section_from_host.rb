class DeleteColumnSectionFromHost < ActiveRecord::Migration[5.2]
  def change
      change_table :hosts do |t|
      remove_column :hosts, :section
    end
  end
end
