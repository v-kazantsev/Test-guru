class SessionController < Devise::SessionsController
  def new
    super
  end
  def destroy
    super
  end

  def create
    super
      flash.notice = "Welcome, #{current_user.first_name}"
    end
end
