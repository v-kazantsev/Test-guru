class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_title
  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found
  #
  # private
  #
  # def rescue_with_record_not_found
  #   render plain: 'Запись не найдена'
  # end

  def set_title
    @page_title = "Test Guru"
  end
end
