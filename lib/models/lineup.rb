class Lineup < ActiveRecord::Base
  belongs_to :player
  belongs_to :team
end
