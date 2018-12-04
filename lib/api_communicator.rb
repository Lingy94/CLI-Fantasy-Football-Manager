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

def filter_gk_array
  create_gk_array.map do |player_hash|
    player_hash.select do |key, value|
      ["first_name", "second_name", "points_per_game", "now_cost"].include? key
    end
  end
end

def filter_mid_array
  create_mid_array.map do |player_hash|
    player_hash.select do |key, value|
      ["first_name", "second_name", "points_per_game", "now_cost"].include? key
    end
  end
end

def filter_def_array
  create_def_array.map do |player_hash|
    player_hash.select do |key, value|
      ["first_name", "second_name", "points_per_game", "now_cost"].include? key
    end
  end
end

def filter_strike_array
  create_strike_array.map do |player_hash|
    player_hash.select do |key, value|
      ["first_name", "second_name", "points_per_game", "now_cost"].include? key
    end
  end
end

#   player_hash.each do |key, value|
#       if key == "first_name" || key == "second_name" || key == "now_cost" || key == "points_per_game"
#         arr << {key => value}
#       end
#     end
