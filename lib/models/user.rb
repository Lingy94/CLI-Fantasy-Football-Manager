class User < ActiveRecord::Base
  has_many :teams

def display_results
  puts "\nWins: #{self.wins}"
  puts "Losses: #{self.losses}"
  puts "Draws: #{self.draws}"
end


end
