class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  private

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
  
end
