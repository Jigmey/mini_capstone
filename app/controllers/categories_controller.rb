class CategoriesController < ApplicationController
	def show
		if params[:category_id]
			tags=Category.find_by(id: params[:category_id]).games
			@games= tags.games
		else
			@games=Game.all
		end
	end
end
