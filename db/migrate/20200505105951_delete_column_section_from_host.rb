class DeleteColumnSectionFromHost < ActiveRecord::Migration[5.2]
  def change
    alter_table :hosts do |t|
      remove_column :hosts, :section
    end
  end
end
