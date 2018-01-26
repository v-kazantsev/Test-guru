class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  include PreviousUrl
  include DeviseWhitelist

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
