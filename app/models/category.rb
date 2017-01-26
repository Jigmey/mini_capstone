class Category < ApplicationRecord
	has_many :categorized_games
	has_many :games, through: :categorized_games
end
