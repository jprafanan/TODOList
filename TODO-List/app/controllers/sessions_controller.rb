class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email_and_password(params[:session][:email],params[:session][:password])
		 if sign_in(user)
		 	redirect_to items_path
		 else
		 	redirect_to :back
		 end
	end

	def destroy
		cookies.delete(:user_id)
		redirect_to root_path
	end
end