class Player < ActiveRecord::Base
  has_many :selections
  has_many :teams, through: :selections
end
