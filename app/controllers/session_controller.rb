class SessionController < Devise::SessionsController
  def create
    super
    flash.notice = "Welcome, #{current_user.first_name}"
  end
end
