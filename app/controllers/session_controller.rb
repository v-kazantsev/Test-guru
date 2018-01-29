class SessionController < Devise::SessionsController
  skip_before_action :set_previous_url
  def create
    super
    flash.notice = "Welcome, #{current_user.first_name}"
  end
end
