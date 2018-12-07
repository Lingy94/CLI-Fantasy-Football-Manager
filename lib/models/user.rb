class User < ActiveRecord::Base
  has_many :teams

def display_results
  puts "Wins: #{self.wins}"
  puts "Losses: #{self.losses}"
  puts "Draws: #{self.draws}"
end

def ask_for_stats
  puts "Would you like to ask for your stats? (Y/N)"
  choice2 = gets.chomp
    if choice2.downcase == "y"
      self.display_results
    elsif choice2.downcase == "n"
      bye = Artii::Base.new
      puts bye.asciify('Thanks for playing!').colorize(:yellow)
    else
      puts "Invalid command. Please try again."
      play_or_exit(hash)
    end
  end
end
