class UsersController < ApplicationController

	def index
		@users = User.all.order(points: :desc)
		render json: @users
	end
	
	def create
		user_data = JSON.parse(request.body.string)
		@user = User.find_by(email: user_data['email'])
		if @user 
			render json: @user
		else
			@user = User.create(email: user_data['email'], avatar: user_data['photo'])
			render json: @user
		end
	end

	def show
	end
end

