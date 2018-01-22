class SessionsController < ApplicationController
  skip_before_action :set_cookie
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      byebug
      if cookies[:previous_url].present?
        redirect_to cookies[:previous_url], notice: 'You have been redirected'
      else
        redirect_to tests_path
      end
    else
      flash.now[:alert] = 'Wrong password or e-mail'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "You have been logged off"
  end

end
