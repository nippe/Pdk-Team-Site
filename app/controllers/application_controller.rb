class ApplicationController < ActionController::Base
  before_filter :require_user
  helper_method :current_user
  protect_from_forgery


  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end


  def require_user
    unless current_user
      #store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to :login
      return false
    end
  end

  #def require_user
  #  if current_user
  #    return true
  #  else
  #    return false
  #  end
  #end
end
