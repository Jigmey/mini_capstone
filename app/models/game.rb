class Game < ApplicationRecord
	validates :name, presence: true
	validates :price, :numericality => {:greater_than=> 0, :less_than_or_equal_to=> 1000}

	
	belongs_to :suppliers,optional: true
	has_many :carted_products
	has_many :orders, through: :carted_products
	has_many :categorized_games
	has_many :categories, through: :categorized_games
end
