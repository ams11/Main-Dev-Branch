class ApplicationController < ActionController::Base
	protect_from_forgery

	helper_method :current_user_session, :current_user

	before_filter :set_current_user
	
	protected
	def current_user_session
		@current_user_session ||= UserSession.find
	end
	
	def current_user
		@current_user ||= current_user_session && current_user_session.user
	end
	
	def set_current_user
		Authorization.current_user = current_user
	end
  
end


