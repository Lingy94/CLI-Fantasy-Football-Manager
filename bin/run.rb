require_relative '../config/environment'




puts "HELLO WORLD"

Pry.start
turn_counter = 0
user = welcome
team = ask_for_team_name(user)
pick_goal_keeper(team)
pick_defender
