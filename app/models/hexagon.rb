class Hexagon < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :game, presence: true
end
