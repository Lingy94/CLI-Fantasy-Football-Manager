require_relative '../config/environment'

puts "HELLO WORLD"

Pry.start
turn_counter = 0

hash = set_up_user_and_team
play(hash)

#play_or_exit(hash)
