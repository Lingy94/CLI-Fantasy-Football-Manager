class Player < ActiveRecord::Base
  has_many :lineups
  has_many :teams, through: :lineups
end
