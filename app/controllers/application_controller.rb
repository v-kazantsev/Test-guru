class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cookie
  before_action :authenticate_user!

  helper_method :current_user, :logged_in?, :original_url

  def set_cookie
    cookies[:previous_url] = request.original_url
  end

  private
  def authenticate_user!
    unless current_user
      redirect_to login_path
    end
  end

  def original_url
    base_url + original_fullpath
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
