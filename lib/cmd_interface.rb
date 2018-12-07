def welcome
  a = Artii::Base.new
  puts a.asciify('Wannabe Manager').colorize(:green)
  puts "by Jack and Tom!

What's your name?".colorize(:magenta)
  your_name = gets.chomp
  current = User.all.find { |user_hash| user_hash.username == your_name }
    if current
      puts "\nWelcome back, #{current.username}!\n".colorize(:green)
      return current
    else
      puts "\nHi, #{your_name}!\n".colorize(:green)
      return User.create(username: your_name, wins: 0, losses: 0, draws: 0)
    end
  #write condition to check if user already exists
end
#
  def intro_mp3
    Gosu::Sample.new("lib/music/motd_intro.mp3").play
  end
def cpu_create_default_team
  cpu = User.create(username: "CPU", wins: 0, losses: 0, draws: 0)
  cpu_team = Team.create(team_name: "CPU_Team", user_id: cpu.id)
  Selection.create(team_id: cpu_team.id, player_id: 2)
  Selection.create(team_id: cpu_team.id, player_id: 13)
  Selection.create(team_id: cpu_team.id, player_id: 23)
  Selection.create(team_id: cpu_team.id, player_id: 18)
  Selection.create(team_id: cpu_team.id, player_id: 45)
  return "CPU_Team created."
end

def ask_for_team_name(user)
  puts "\nWhat's your team name?\n".colorize(:magenta)
  your_team = gets.chomp
  return Team.create(team_name: your_team, user_id: user.id)
end
#
def set_up_user_and_team
  user = welcome
  team = ask_for_team_name(user)
  puts "\nYou will need to select:\n"
  puts "1 Goalkeeper\n1 Defender\n2 Midfielders\n1 Striker\n".colorize(:green)
  team.pick_goal_keeper
  team.pick_defender
  team.pick_midfielder("first")
  team.pick_midfielder("second") #avoid duplicate midfielders
  team.pick_striker
  return {team: team, user: user}
end

def total_team_goals(team)
  team_total_points = 0
  team.players.each {|player| team_total_points += player.avg_points}
  return team_total_points / 2 + rand(1)
end

def compare_teams(team_1, team_2)
  Gosu::Sample.new("lib/music/vuvuzela.mp3").play
  if total_team_goals(team_1) > total_team_goals(team_2)
    new_team_1_var = team_1.user.wins + 1
    new_team_2_var = team_2.user.losses + 1
    team_2.user.update(losses: new_team_2_var)
    team_1.user.update(wins: new_team_1_var)
    puts "\nThe score was #{team_1.team_name} #{total_team_goals(team_1)} - #{total_team_goals(team_2)} #{team_2.team_name}".colorize(:yellow)
    puts "#{team_1.team_name} won the match! Congrats, #{team_1.user.username}!\n".colorize(:yellow)
  elsif total_team_goals(team_1) < total_team_goals(team_2)
    new_team_1_var = team_1.user.losses + 1
    new_team_2_var = team_2.user.wins + 1
    team_1.user.update(losses: new_team_1_var)
    team_2.user.update(wins: new_team_2_var)
    puts "\nThe score was #{team_1.team_name} #{total_team_goals(team_1)} - #{total_team_goals(team_2)} #{team_2.team_name}".colorize(:yellow)
    puts "#{team_2.team_name} won the match! Congrats, #{team_2.user.username}!\n".colorize(:yellow)
  else
    new_team_1_var = team_1.user.draws + 1
    new_team_2_var = team_2.user.draws + 1
    team_1.user.update(draws: new_team_1_var)
    team_2.user.update(draws: new_team_2_var)
    puts "\nThe score was #{team_1.team_name} #{total_team_goals(team_1)} - #{total_team_goals(team_2)} #{team_2.team_name}".colorize(:yellow)
    puts "\nThe game was a draw!\n".colorize(:yellow)
  end
end

def play_or_exit(hash)
  puts "Would you like to challenge another team? (Y/N)".colorize(:magenta)
  choice = gets.chomp.downcase
    if choice == "y"
      play(hash)
    elsif choice == "n"
    ask_for_stats(hash)
  end
  end

  def ask_for_stats(hash)
    puts "Would you like to ask for your stats? (Y/N)".colorize(:magenta)
    choice2 = gets.chomp
      if choice2.downcase == "y"
        players_id = hash[:user].id
        user = User.all.find {|user| user.id == players_id}
        user.display_results
      elsif choice2.downcase == "n"
        bye = Artii::Base.new
        puts bye.asciify('Thanks for playing!').colorize(:yellow)
      else
        puts "Invalid command. Please try again."
        play_or_exit(hash)
      end
    end


#
# def compare_teams(team_1, team_2)
#   team_1_total = 0
#   team_1.players.each {|player| team_1_total += player.avg_points}
#   team_2_total = 0
#   team_2.players.each {|player| team_2_total += player.avg_points}
#
#   if team_1_total > team_2_total
#     team_1.user.wins += 1
#     team_2.user.losses += 1
#     return team_1
#   elsif team_2_total > team_1_total
#     team_2.user.wins += 1
#     team_1.user.losses +=1
#     return team_2
#   else
#     team_1.user.draws += 1
#     team_2.user.draws += 1
#     return "Draw"
#   end
# end
#
# def declare_winner(result)
#   if result.class == String
#     puts "\nThe game was a draw!\n"
#   else puts "\nTeam #{result.team_name} won the match! Congrats, #{result.user.username}!\n".colorize(:yellow)
#   end
# end
#
# def play(hash)
#   user = hash[:user]
#   team = hash[:team]
#   puts "\nWhich team would you like to challenge?\n".colorize(:magenta)
# #iterate
# numbered_teams = []
#   list_of_teams = Team.all.map { |team_hash|
#     team_hash.team_name }
#
#   Team.all.each_with_index { |team_hash, index|
#     numbered_teams << "#{index +1}. #{team_hash.team_name}" }
#
#   puts numbered_teams
#
#   chosen_team_number = gets.chomp.to_i
#   chosen_team_name = list_of_teams[chosen_team_number - 1]
#     if list_of_teams.any? {|team_obj| team_obj == chosen_team_name}
#       team_2 = Team.all.find {|team_obj| team_obj.team_name == chosen_team_name}
#     else
#       puts "\nUnrecognised team, please try again.\n".colorize(:red)
#       play(hash)
#     end
#
#     compare_teams(team, team_2)
#     play_or_exit(hash)
#     end
# #   result = compare_teams(team, team_2)
# #   if result != "Draw"
# #     result.user.win
# #   end
# #   declare_winner(result)
# #     Gosu::Sample.new("lib/music/vuvuzela.mp3").play
# #   play_or_exit(hash)
# # end
#
#
def play(hash)
  user = hash[:user]
  team = hash[:team]
  puts "\nWhich team would you like to challenge?\n".colorize(:magenta)
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
      puts "\nUnrecognised team, please try again.\n".colorize(:red)
      play(hash)
    end

  compare_teams(team, team_2)
  play_or_exit(hash)
end
# #
# # def compare_teams(team_1, team_2)
# #   team_1_total = 0
# #   team_1.players.each {|player| team_1_total += player.avg_points}
# #   team_2_total = 0
# #   team_2.players.each {|player| team_2_total += player.avg_points}
# #
# #   if team_1_total > team_2_total
# #     # team_1.user.win
# #     # team_2.user.lose
# #     return team_1
# #   elsif team_2_total > team_1_total
# #     # team_2.user.win
# #     # team_1.user.lose
# #     return team_2
# #   else
# #     # team_1.user.draw
# #     # team_2.user.draw
# #     return "Draw"
# #   end
# # end
# #
# #   def play_or_exit(hash)
# #     puts "Would you like to challenge another team? (Y/N)"
# #     choice = gets.chomp
# #       if choice.downcase == "y"
# #         play(hash)
# #       elsif choice.downcase == "n"
# #         goodbye
# #       else
# #         puts "Invalid option. Please try again."
# #         play_or_exit(hash)
# #       end
# #     end
# #

# #
# #   def goodbye
# #     bye = Artii::Base.new
# #     puts bye.asciify('Thanks for playing!').colorize(:yellow)
# #   end
#
#
#
# def welcome
#   puts "Welcome to Fantasy Football by Jack and Tom!
# What's your name?"
#   your_name = gets.chomp
#   current = User.all.find { |user_hash| user_hash.username == your_name }
#     if current
#       puts "\nWelcome back, #{current.username}!\n"
#       return current
#     else
#       puts "\nHi, #{your_name}!\n"
#       return User.create(username: your_name, wins: 0, losses: 0, draws: 0)
#     end
#   #write condition to check if user already exists
# end
#
# # def work_out_user_id(counter)
# #   if counter % 2 == 0
# #     user_2.id
# #   else
# #     user.id
# #   end
# # end
#
# def ask_for_team_name(user)
#   puts "\nWhat do you what to name your team?\n"
#   your_team = gets.chomp
#   return Team.create(team_name: your_team, user_id: user.id)
# end
#
# def set_up_user_and_team
#   user = welcome
#   team = ask_for_team_name(user)
#   puts "\nYou will need to select:\n1 Goalkeeper\n1 Defender\n2 Midfielders\n1 Striker\n"
#   team.pick_goal_keeper
#   team.pick_defender
#   team.pick_midfielder("first")
#   team.pick_midfielder("second") #avoid duplicate midfielders
#   team.pick_striker
#   return {team: team, user: user}
# end
#
# def total_team_goals(team)
#   team_total_points = 0
#   team.players.each {|player| team_total_points += player.avg_points}
#   return team_total_points / 2 + rand(1)
# end
#
# def compare_teams(team_1, team_2)
#   if total_team_goals(team_1) > total_team_goals(team_2)
#     winner = team_1
#     loser = team_2
#     puts "\nThe score was #{team_1.team_name} #{total_team_goals(team_1)} - #{total_team_goals(team_2)} #{team_2.team_name}".colorize(:yellow)
#     puts "#{result.team_name} won the match! Congrats, #{winner.user.username}!\n".colorize(:yellow)
#   elsif total_team_goals(team_1) < total_team_goals(team_2)
#     winner = team_2
#     loser = team_1
#     puts "\nThe score was #{team_1.team_name} #{total_team_goals(team_1)} - #{total_team_goals(team_2)} #{team_2.team_name}".colorize(:yellow)
#     puts "#{team_2.team_name} won the match! Congrats, #{team_2.user.username}!\n".colorize(:yellow)
#   else
#     puts "\nThe game was a draw! Both teams had a score of #{total_team_goals(team_1)}.\n".colorize(:yellow)
#   end
# end
#
#
#
# def play(hash)
#   user = hash[:user]
#   team = hash[:team]
#   puts "\nWhich team would you like to challenge?\n".colorize(:magenta)
# #iterate
# numbered_teams = []
#   list_of_teams = Team.all.map { |team_hash|
#     team_hash.team_name }
#
#   Team.all.each_with_index { |team_hash, index|
#     numbered_teams << "#{index +1}. #{team_hash.team_name}" }
#
#   puts numbered_teams
#
#   chosen_team_number = gets.chomp.to_i
#   chosen_team_name = list_of_teams[chosen_team_number - 1]
#     if list_of_teams.any? {|team_obj| team_obj == chosen_team_name}
#       team_2 = Team.all.find {|team_obj| team_obj.team_name == chosen_team_name}
#     else
#       puts "\nUnrecognised team, please try again.\n".colorize(:red)
#       play(hash)
#     end
#
#   compare_teams(team, team_2)
#   play_or_exit(hash)
# end
#
# # def compare_teams(team_1, team_2)
# #   team_1_total = 0
# #   team_1.players.each {|player| team_1_total += player.avg_points}
# #   team_2_total = 0
# #   team_2.players.each {|player| team_2_total += player.avg_points}
# #
# #   if team_1_total > team_2_total
# #     # team_1.user.win
# #     # team_2.user.lose
# #     return team_1
# #   elsif team_2_total > team_1_total
# #     # team_2.user.win
# #     # team_1.user.lose
# #     return team_2
# #   else
# #     # team_1.user.draw
# #     # team_2.user.draw
# #     return "Draw"
# #   end
# # end

  # def play_or_exit(hash)
  #   puts "Would you like to challenge another team? (Y/N)"
  #   choice = gets.chomp.downcase
  #     if choice == "y"
  #       play(hash)
  #     elsif choice == "n"
  #       return "Goodbye! Thanks for playing!".colorize(:yellow)
  #     end
  #   end
  #
  #   def artify
  #     a = Artii::Base.new
  #     a.asciify('Wannabe Manager')
  #   end
