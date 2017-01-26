class Things < ActiveRecord::Migration[5.0]
  def change
  	remove_column :categorized_games, :category_id, :string
  end
end
