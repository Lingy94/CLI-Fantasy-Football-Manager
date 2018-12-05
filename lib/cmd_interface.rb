def welcome
  puts "Hello! What's your name?"
  your_name = gets.chomp
  return User.create(username: your_name)
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
  puts selected_data_gk_array.map do |element|
    element["second_name"]
  end
  your_goalie_name = gets.chomp
  Player.all.each do |player_obj|
    if player_obj.second_name == your_goalie_name && player_obj.element_type == 1
      Selection.create(team_id: team.id, player_id: player_obj.id)
      return "#{your_goalie_name} has been added to your team!"
    end
  end
  pick_goal_keeper
  #if no valid keeper, prompt again
end

def pick_defender(team)
  puts "Pick your Defender from second name"
  puts selected_data_def_array.map do |element|
    element["second_name"]
  end
  your_defender_name = gets.chomp
  Player.all.each do |player_obj|
    if player_obj.second_name == your_defender_name && player_obj.element_type == 2
      Selection.create(team_id: team.id, player_id: player_obj.id)
      return "#{your_defender_name} has been added to your team!"
    end
  end
  puts "#{your_defender_name} has been added to your team!"
end

def pick_midfielder(team)
  puts "Pick your Midfielder from second name"
  puts selected_data_mid_array.map do |element|
    element["second_name"]
  end
  your_midfielder_name = gets.chomp
  Player.all.each do |player_obj|
    if player_obj.second_name == your_midfielder_name && player_obj.element_type == 3
      Selection.create(team_id: team.id, player_id: player_obj.id)
      return "#{your_midfielder_name} has been added to your team!"
    end
  end
  puts "#{your_midfielder_name} has been added to your team!"
end

def pick_striker(team)
  puts "Pick your Striker from second name"
  puts selected_data_strike_array.map do |element|
    element["second_name"]
  end
  your_striker_name = gets.chomp
  Player.all.each do |player_obj|
    if player_obj.second_name == your_striker_name && player_obj.element_type == 4
      Selection.create(team_id: team.id, player_id: player_obj.id)
      return "#{your_striker_name} has been added to your team!"
    end
  end
  puts "#{your_striker_name} has been added to your team!"
end

def cpu_pick_team

end
