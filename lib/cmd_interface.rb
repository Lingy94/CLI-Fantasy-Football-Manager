def welcome
  puts "Welcome to Fantasy Football by Jack and Tom!\n
  You will need to select:\n1 Goalkeeper\n1 Defender\n2 Midfielders\n1 Striker\nWhat's your name?"
  your_name = gets.chomp
  return User.create(username: your_name)
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
  puts "What do you what to name your team?"
  your_team = gets.chomp
  return Team.create(team_name: your_team, user_id: user.id)
end

def pick_goal_keeper(team)
  puts "Pick your Goal Keeper from second name"
  list_of_names = selected_data_gk_array.map do |element|
    element["second_name"]
  end
  puts list_of_names
  your_goalie_name = gets.chomp
  if Player.all.any? {|player_obj| player_obj.second_name == your_goalie_name}
    Player.all.each do |player_obj|
      if player_obj.second_name == your_goalie_name && player_obj.element_type == 1
        Selection.create(team_id: team.id, player_id: player_obj.id)
        puts "#{your_goalie_name} has been added to your team!"
      end
    end
  else
    puts "Invalid name. Please select again."
    pick_goal_keeper(team)
  end
end


  #if no valid keeper, prompt again


def pick_defender(team)
  puts "Pick your Defender from second name"
  list_of_names = selected_data_def_array.map do |element|
    element["second_name"]
  end
  puts list_of_names
  your_defender_name = gets.chomp
  if Player.all.any? {|player_obj| player_obj.second_name == your_defender_name}
    Player.all.each do
      |player_obj|if player_obj.second_name == your_defender_name && player_obj.element_type == 2
      Selection.create(team_id: team.id, player_id: player_obj.id)
      puts "#{your_defender_name} has been added to your team!"
    end
  end
  else
    puts "Invalid name. Please select again."
    pick_defender(team)
  end
end

def pick_midfielder(team, turn)
  puts "Pick your #{turn} Midfielder from second name"
  list_of_names = selected_data_mid_array.map do |element|
    element["second_name"]
  end
  puts list_of_names
  your_midfielder_name = gets.chomp
  if Player.all.any? {|player_obj| player_obj.second_name == your_midfielder_name}
  Player.all.each do |player_obj|
    if player_obj.second_name == your_midfielder_name && player_obj.element_type == 3
      Selection.create(team_id: team.id, player_id: player_obj.id)
      puts "#{your_midfielder_name} has been added to your team!"
    end
  end
  else
    puts "Invalid name. Please select again."
    pick_midfielder(team)
  end
end

def pick_striker(team)
  puts "Pick your Striker from second name"
  list_of_names = selected_data_strike_array.map do
    |element| element["second_name"]
  end

  puts list_of_names
  your_striker_name = gets.chomp

  if Player.all.any? {|player_obj| player_obj.second_name == your_striker_name}
  Player.all.each do |player_obj|
    if player_obj.second_name == your_striker_name && player_obj.element_type == 4
      Selection.create(team_id: team.id, player_id: player_obj.id)
      puts "#{your_striker_name} has been added to your team!"
    end
  end
  else
    puts "Invalid name. Please select again."
    pick_striker(team)
  end
end

current_team = nil

def set_up_user_and_team
  user = welcome
  team = ask_for_team_name(user)
  current_team = team
  pick_goal_keeper(team)
  pick_defender(team)
  pick_midfielder(team, "first")
  pick_midfielder(team, "second") #avoid duplicate midfielders
  pick_striker(team)
end

def play_or_set_up
  puts "Would you like to:\n1. Set up a new user.\n2. Challenge another team.\n(setup or challenge or exit)"
  choice = gets.chomp
  if  choice == "setup"
    set_up_user_and_team
  elsif choice == "challenge"
    play
  # elsif choice == "exit"
  #   break
  else
    puts "Unrecognised command"
    play_or_set_up
  end
end

def play

end





# def play_teams(team1, team2)
#
#   list_of_teams = Team.all.map {|team| team.team_name}
#   puts "Please select your opponent.\n #{list_of_teams}"
# opponent = gets.chomp
# total_points_for_team1 =
# total_points_for_team2 =
# end
