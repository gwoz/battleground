class UsersController < ApplicationController

	def create
		user_data = JSON.parse(request.body.string)
		@user = User.find_or_create_by(email: user_data['email'])
		render json: @user
	end

	def show
	end
end

