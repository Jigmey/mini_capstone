class CartedProductsController < ApplicationController
	before_action :admin_authentication!
	def index
		@cartedproducts=current_user.carted_products
	end
	def create
		@cartedproducts=CartedProduct.new(
		game_id: params["game_id"],
		quantity: params["quantity"],
		user_id: current_user.id,
		status: "Carted"
		)
		@cartedproducts.save
		redirect_to "/carted_products"
	end
end
#current_user.carted_products.where (:status = "carted")