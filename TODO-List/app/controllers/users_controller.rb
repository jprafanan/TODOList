class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		sign_in @user
		redirect_to items_path
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update_attributes(user_params)
		redirect_to items_path
	end

	private
		def user_params
			params.require(:user).permit(:email, :password)
		end	

end