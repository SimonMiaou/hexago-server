class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games, &:timestamps
  end
end
