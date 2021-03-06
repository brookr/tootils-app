# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  helper_method :current_user_session, :current_user
  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    def require_user
        unless current_user
          store_location
          flash[:notice] = "You must be logged in to access this page (#{request.url})"
          redirect_to signin_path
          return false
        end
      end

    def require_no_user
      if current_user
        if ['http://tootils.local/signin', 'http://tootils.local/user_session/new'].include? request.url
          redirect_to account_url
          return true
        end
        flash[:notice] = "You must be logged out to access this page (#{request.url})"
        redirect_to root_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.url
    end
    
    def redirect_back_or_default(path)
      return_to = session[:return_to]
      session[:return_to] = nil
      redirect_to (return_to || :back )
      rescue ActionController::RedirectBackError
      redirect_to path
    end
end
