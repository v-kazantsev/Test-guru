class PagesController < ApplicationController
  def feedback
  end
  def create
    FeedbackMailer.feedback(current_user, params[:message_body]).deliver
    redirect_to tests_path
  end
end
