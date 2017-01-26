class ProductsController < ApplicationController
	before_action :admin_authentication!, only:[:edit,:create,:update,:new,:destroy]
	def index
		@user=User.find_by(id: params["id"])
		@games=Game.all	
		render 'index.html.erb'
	end
	def show
		if params["id"]=='random'
			@game=Game.all.sample[0]
		else
			@game=Game.find_by(id: params["id"])
		end

		render 'show.html.erb'
	end
	def new
		@game=Game.new
	end
	def create
			@game= Game.new(
				name: params["name"],
				price: params["price"], 
				description: params["description"], 
				supplier_id: params["supplier_id"]
				)
			
			if @game.save
				 p flash[:success] = 'New game added' 
				redirect_to"/photo/#{@game.id}"
			else
				render 'new.html.erb'
			end

	end
	def edit
			@game=Game.find_by(id: params["id"])
			render'edit.html.erb'
	end
	def update
		@game=Game.find_by(id: params["id"])

		if @game.update(
			name: params["name"],
			price: params["price"], 
			description: params["description"]
			)
			p flash[:success] = 'Game edited' 
			redirect_to"/photo/#{@game.id}"
		else		
			render'edit.html.erb'
		end
	end
	def delete
			@game=Game.find_by(id: params["id"] )
			@game.delete
			render 'delete.html.erb'
	end
	def low_to_high_Orders
		@user_id= session[:user_id]
		session[:user_id]=nil
		@low_to_high_Order=Game.order(:price);
		render 'low_to_high_Order.html.erb'
	end
	def high_to_low_Orders
		@high_to_low_Order=Game.order(price: :desc);
		render'high_to_low_Order.html.erb'
	end
	def sort_low_to_high
		
	end
end
