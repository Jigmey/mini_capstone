class OrdersController < ApplicationController
	before_action :admin_authentication!, only [:create]
	def create
		carted_products = current_user.carted_products.where(status: "carted")

		@order=Order.new(
			quantity: params[:quantity],
			user_id: current_user.id
		)
		@order.save
		redirect_to "/orders/#{@order.user_id}"
	    p flash[:success] = 'You bought the game!'
	    
	    carted_products.each do |carted_product|
	      carted_product.update(status: "purchased")
	      carted_product.update(order_id: @order.id)
		end
	end

	def show
		@order = Order.find(params[:id])
		unless current_user.id ==@order.user_id || current_user.admin 
			redirect_to 'photo/login'
		end
	end
end
