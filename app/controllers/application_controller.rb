class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_locale

  #include PreviousUrl
  include DeviseWhitelist

  def default_url_options
    unless I18n.locale == I18n.default_locale
      { lang: I18n.locale }
    else
      super
    end
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def current_user_admin?
    current_user.is_a?(Admin)
  end

  def after_sign_in_path_for(resource)
    if current_user_admin?
      admin_root_path
    else
      root_path
    end
  end
end
