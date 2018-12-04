class CreateLineupsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :lineups do |t|
      t.integer :team_id
      t.integer :player_id
    end
  end
end
