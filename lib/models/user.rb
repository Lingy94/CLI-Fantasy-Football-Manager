class User < ActiveRecord::Base
  has_many :teams

def win
self.wins += 1
end

def lose
self.losses += 1
end

def draw
self.draws += 1
end


end
