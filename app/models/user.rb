class User < ApplicationRecord
  has_many_and_belongs_to :games
end
