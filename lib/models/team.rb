class Team < ActiveRecord::Base
  belongs_to :user
  has_many :selections
  has_many :players, through: :selections

  def challenge_team(team_2)
  team_1_total = 0
  self.each {|player| team_1_total += player.avg_points}
  team_2_total = 0
  team_2.each {|player| team_2_total += player.avg_points}

  if team_1_total > team_2_total
    "#{self.team_name} beat #{team_2.team_name} by #{team_1_total} points to #{team_2_total}!"
  elsif
  team_2_total > team_1_total
      "#{team_2.team_name} beat #{self.team_name}by #{team_2_total} points to #{team_1_total}!"
#consider converting to goals?
    else
      "Game was a draw!"
  end
end


end
