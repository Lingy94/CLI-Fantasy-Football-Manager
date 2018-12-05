class Team < ActiveRecord::Base
  belongs_to :user
  has_many :selections
  has_many :players, through: :selections
end
