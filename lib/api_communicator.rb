require 'rest-client'
require 'JSON'

def get_players_from_api
  response_string = RestClient.get('https://fantasy.premierleague.com/drf/bootstrap-static')
  response_hash = JSON.parse(response_string)
  player_arrays = response_hash["elements"]
end

# could randomise playerlist in the future
def create_gk_array
  get_players_from_api.select do |player_hash|
    player_hash["element_type"] == 1
  end[0..5]
end

def create_def_array
  get_players_from_api.select do |player_hash|
    player_hash["element_type"] == 2
  end[0..10]
end

def create_mid_array
  get_players_from_api.select do |player_hash|
    player_hash["element_type"] == 3
  end[0..20]
end

def create_strike_array
  get_players_from_api.select do |player_hash|
    player_hash["element_type"] == 4
  end[0..10]
end

def selected_data_gk_array
  create_gk_array.map do |player_hash|
    player_hash.select do |key, value|
      ["first_name", "second_name", "points_per_game", "now_cost", "element_type"].include? key
    end
  end
end

def selected_data_mid_array
  create_mid_array.map do |player_hash|
    player_hash.select do |key, value|
      ["first_name", "second_name", "points_per_game", "now_cost", "element_type"].include? key
    end
  end
end

def selected_data_def_array
  create_def_array.map do |player_hash|
    player_hash.select do |key, value|
      ["first_name", "second_name", "points_per_game", "now_cost", "element_type"].include? key
    end
  end
end

def selected_data_strike_array
  create_strike_array.map do |player_hash|
    player_hash.select do |key, value|
      ["first_name", "second_name", "points_per_game", "now_cost", "element_type"].include? key
    end
  end
end


def gk_populate_db_selected_data
  selected_data_gk_array.each do |player_hash|
    Player.create(first_name: player_hash.values[0], second_name: player_hash.values[1], avg_points: player_hash.values[3].to_f, cost_of_player: player_hash.values[2], element_type: player_hash.values[4])
  end
end

def def_populate_db_selected_data
  selected_data_def_array.each do |player_hash|
    Player.create(first_name: player_hash.values[0], second_name: player_hash.values[1], avg_points: player_hash.values[3].to_f, cost_of_player: player_hash.values[2], element_type: player_hash.values[4])
  end
end

def mid_populate_db_selected_data
  selected_data_mid_array.each do |player_hash|
    Player.create(first_name: player_hash.values[0], second_name: player_hash.values[1], avg_points: player_hash.values[3].to_f, cost_of_player: player_hash.values[2], element_type: player_hash.values[4])
  end
end

def strike_populate_db_selected_data
  selected_data_mid_array.each do |player_hash|
    Player.create(first_name: player_hash.values[0], second_name: player_hash.values[1], avg_points: player_hash.values[3].to_f, cost_of_player: player_hash.values[2], element_type: player_hash.values[4])
  end
end

def populate_players_table
  gk_populate_db_selected_data
  def_populate_db_selected_data
  mid_populate_db_selected_data
  strike_populate_db_selected_data
end

# def pick_player(name)
#   filter_mid_array.each do |player_hash|
#     if player_hash["second_name"] == name
#        player_stats =  player_hash
#        binding.pry
#     end
#     Player.new(first)
#     @first_name = player_stats["first_name"]
#     @second_name = player_stats["second_name"]
#
#     Player.create()
#   end
# end

#   player_hash.each do |key, value|
#       if key == "first_name" || key == "second_name" || key == "now_cost" || key == "points_per_game"
#         arr << {key => value}
#       end
#     end

# def selected_data_gk_array
#   create_gk_array.map do |player_hash|
#     player_hash.select do |key, value|
#       ["first_name", "second_name", "points_per_game", "now_cost", "element_type", "team_code"].include? key
#     end
#   end
# end
#
# def selected_data_mid_array
#   create_mid_array.map do |player_hash|
#     player_hash.select do |key, value|
#       ["first_name", "second_name", "points_per_game", "now_cost", "element_type", "team_code"].include? key
#     end
#   end
# end
#
# def selected_data_def_array
#   create_def_array.map do |player_hash|
#     player_hash.select do |key, value|
#       ["first_name", "second_name", "points_per_game", "now_cost", "element_type", "team_code"].include? key
#     end
#   end
# end
#
# def selected_data_strike_array
#   create_strike_array.map do |player_hash|
#     player_hash.select do |key, value|
#       ["first_name", "second_name", "points_per_game", "now_cost", "element_type", "team_code"].include? key
#     end
#   end
# end

# def gk_populate_db_selected_data
#   selected_data_gk_array.each do |player_hash|
#     Player.create(first_name: player_hash.values[0], second_name: player_hash.values[1], avg_points: player_hash.values[3].to_f, cost_of_player: player_hash.values[2], element_type: player_hash.values[4], club: player_hash.values[5])
#   end
# end
#
# def def_populate_db_selected_data
#   selected_data_def_array.each do |player_hash|
#     Player.create(first_name: player_hash.values[0], second_name: player_hash.values[1], avg_points: player_hash.values[3].to_f, cost_of_player: player_hash.values[2], element_type: player_hash.values[4], club: player_hash.values[5])
#   end
# end
#
# def mid_populate_db_selected_data
#   selected_data_mid_array.each do |player_hash|
#     Player.create(first_name: player_hash.values[0], second_name: player_hash.values[1], avg_points: player_hash.values[3].to_f, cost_of_player: player_hash.values[2], element_type: player_hash.values[4], club: player_hash.values[5])
#   end
# end
#
# def strike_populate_db_selected_data
#   selected_data_mid_array.each do |player_hash|
#     Player.create(first_name: player_hash.values[0], second_name: player_hash.values[1], avg_points: player_hash.values[3].to_f, cost_of_player: player_hash.values[2], element_type: player_hash.values[4], club: player_hash.values[5])
#   end
# end
