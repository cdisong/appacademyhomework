class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def logout!
    reset_session_token!
    session[:session_token] = nil
  end

  def login!(user)
    session[:session_token] = user.reset_session_token
    # user = User.find_by_credentials(email: email, password: password)
    # if user
  end

  def ensure_logged_out
  end

  def ensure_logged_in
  end

end
