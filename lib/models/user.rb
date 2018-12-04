class User < ActiveRecord::Base
  has_many :players
  has_many :stats
  has_many :teams, through: :players

end
