module Welcome
  extend ActiveSupport::Concern
  included do

    after_action :welcome, only: [:create], if: :devise_controller?

    def welcome
      flash.notice = "Welcome, #{current_user.first_name}" if current_user
    end

  end
end
