class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	if cookies[:user_id]
  		user_id = cookies.signed[:user_id]
  		User.find_by_id(user_id)
  	end
  end
  helper_method :current_user  # makes method available for the views

  def sign_in user 
    if user
  	 cookies.signed[:user_id] = user.id
    end
  end

  def authenticate
  	if !signed_in?
  		redirect_to new_session_path
  	end
  end

  def signed_in?
  	current_user
  end
  helper_method :signed_in?

end
