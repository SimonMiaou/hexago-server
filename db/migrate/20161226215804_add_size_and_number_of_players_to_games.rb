class AddSizeAndNumberOfPlayersToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :number_of_players, :integer, null: false, default: 2
    add_column :games, :size, :integer, null: false, default: 9
  end
end
