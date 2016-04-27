class UsersController < ApplicationController

	def index
		@users = order_all_users
		binding.pry
	end
	
	def create
		user_data = JSON.parse(request.body.string)
		@user = User.find_or_create_by(email: user_data['email'], avatar: user_data['photo'])
		render json: @user
	end

	def show
	end
end

