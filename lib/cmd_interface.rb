def welcome
  puts "Welcome to Fantasy Football by Jack and Tom!

What's your name?"
  your_name = gets.chomp
  current = User.all.find { |user_hash| user_hash.username == your_name }
    if current
      puts "\nWelcome back, #{current.username}!\n"
      return current
    else
      puts "\nHi, #{your_name}!\n"
      return User.create(username: your_name, wins: 0, losses: 0, draws: 0)
    end
  #write condition to check if user already exists
end

# def work_out_user_id(counter)
#   if counter % 2 == 0
#     user_2.id
#   else
#     user.id
#   end
# end

def ask_for_team_name(user)
  puts "\nWhat do you what to name your team?\n"
  your_team = gets.chomp
  return Team.create(team_name: your_team, user_id: user.id)
end

def set_up_user_and_team
  user = welcome
  team = ask_for_team_name(user)
  puts "\nYou will need to select:\n1 Goalkeeper\n1 Defender\n2 Midfielders\n1 Striker\n"
  team.pick_goal_keeper
  team.pick_defender
  team.pick_midfielder("first")
  team.pick_midfielder("second") #avoid duplicate midfielders
  team.pick_striker
  return {team: team, user: user}
end

def compare_teams(team_1, team_2)
  team_1_total = 0
  team_1.players.each {|player| team_1_total += player.avg_points}
  team_2_total = 0
  team_2.players.each {|player| team_2_total += player.avg_points}

  if team_1_total > team_2_total
    team_1.user.wins += 1
    team_2.user.losses += 1
    return team_1
  elsif team_2_total > team_1_total
    team_2.user.wins += 1
    team_1.user.losses +=1
    return team_2
  else
    team_1.user.draws += 1
    team_2.user.draws += 1
    return "Draw"
  end
end

def declare_winner(result)
  if result.class == String
    puts "\nThe game was a draw!\n"
  else puts "\nTeam #{result.team_name} won the match! Congrats, #{result.user.username}!\n"
  end
end

def play(hash)
  user = hash[:user]
  team = hash[:team]
  puts "\nWhich team would you like to challenge?\n"
#iterate
numbered_teams = []
  list_of_teams = Team.all.map { |team_hash|
    team_hash.team_name }

  Team.all.each_with_index { |team_hash, index|
    numbered_teams << "#{index +1}. #{team_hash.team_name}" }

  puts numbered_teams

  chosen_team_number = gets.chomp.to_i
  chosen_team_name = list_of_teams[chosen_team_number - 1]
    if list_of_teams.any? {|team_obj| team_obj == chosen_team_name}
      team_2 = Team.all.find {|team_obj| team_obj.team_name == chosen_team_name}
    else
      puts "\nUnrecognised team, please try again.\n"
      play(hash)
    end

  result = compare_teams(team, team_2)
  declare_winner(result)
end

# def compare_teams(team_2)
#   team_1_total = 0
#   self.players.each {|player| team_1_total += player.avg_points}
#   team_2_total = 0
#   team_2.players.each {|player| team_2_total += player.avg_points}
#
#   if team_1_total > team_2_total
#     self.user.wins += 1
#     team_2.user.losses += 1
#     return team_1
#   elsif team_2_total > team_1_total
#     team_2.user.wins += 1
#     self.user.losses +=1
#     return team_2
#   else
#     self.user.draws += 1
#     team_2.user.draws += 1
#     return "Draw"
#   end
# end

  # def play_or_exit(hash)
  #   puts "Would you like to challenge another team? (Y/N)"
  #   choice = gets.chomp.downcase
  #     if choice == "y"
  #       play(hash)
  #     else
  #       return "Thanks for playing!"
  #     end
  #   end





# def play_teams(team1, team2)
#
#   list_of_teams = Team.all.map {|team| team.team_name}
#   puts "Please select your opponent.\n #{list_of_teams}"
# opponent = gets.chomp
# total_points_for_team1 =
# total_points_for_team2 =
# end
