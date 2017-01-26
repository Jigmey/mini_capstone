class ApplicationController < ActionController::Base
	def current_user
    	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  	end
  	helper_method :current_user

  	def game_id
  		@game_id ||= Game.find_by(id: params["id"]) if params["id"]
  	end
  	helper_method :game_id

    def authenticate_user!
    	redirect_to '/login' unless current_user
	end
  def admin_authentication!
    unless current_user && current_user.admin
      redirect_to '/login'
      p flash[:success] = 'You are not a user or admin'
    end 
  end
    protect_from_forgery with: :exception
end
