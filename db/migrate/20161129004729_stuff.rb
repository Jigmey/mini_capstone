class Stuff < ActiveRecord::Migration[5.0]
  def change
  	add_column :categorized_games, :category_id, :integer
  end
end
