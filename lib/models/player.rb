class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  attr_accessor :first_name, :second_name, :now_cost, :avg_points, :user_id, :team_id


  def pick_player(name)
    filter_mid_array.each do |player_hash|
      if player_hash["second_name"] == name
         player_stats =  player_hash
      end
      @first_name = player_stats["first_name"]
      @second_name = player_stats["second_name"]
    end
  end
end
