class CreateHexagons < ActiveRecord::Migration[5.0]
  def change
    create_table :hexagons do |t|
      t.integer :x, null: false
      t.integer :y, null: false
      t.integer :z, null: false
      t.references :game, null: false
      t.references :user
      t.timestamps
    end
  end
end
