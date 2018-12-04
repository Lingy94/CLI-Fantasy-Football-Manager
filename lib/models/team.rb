class Team < ActiveRecord::Base
  belongs_to :user
  has_many :lineups
  has_many :players, through: :lineups
end
