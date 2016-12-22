class CreateGamesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :games_users do |t|
      t.references :game, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
