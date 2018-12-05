class CreateSelectionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :selections do |t|
      t.integer :team_id
      t.integer :player_id
    end
  end
end
