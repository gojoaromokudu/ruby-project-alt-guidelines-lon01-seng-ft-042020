class RemoveAvgAgeFromHosts < ActiveRecord::Migration[5.2]
  def change
      remove_column :hosts, :avg_age
  end
end
