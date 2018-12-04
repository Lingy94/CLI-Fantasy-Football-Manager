class RenamePointsColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :players, :total_points, :avg_points
  end
end
