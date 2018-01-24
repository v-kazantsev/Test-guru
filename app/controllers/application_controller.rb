class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  include PreviousUrl
  include DeviseWhitelist
  include Welcome

  def after_sign_in_path_for(resource)
    admin_root_path
  end
end
