class CreateCategorizedGames < ActiveRecord::Migration[5.0]
  def change
    create_table :categorized_games do |t|
      t.integer :game_id
      t.string :category_id

      t.timestamps
    end
  end
end
