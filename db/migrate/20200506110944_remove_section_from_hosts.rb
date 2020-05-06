class RemoveSectionFromHosts < ActiveRecord::Migration[5.2]
  def change
      remove_column :hosts, :section
  end
end
