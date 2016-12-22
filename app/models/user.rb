class User < ApplicationRecord
  has_many :games_users
  has_many :games, through: :games_users

  validates :name, presence: true
end
