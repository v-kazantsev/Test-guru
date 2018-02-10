class FeedbackMailer < ApplicationMailer
  def feedback(current_user, message_body)
    @user = current_user
    @message = message_body
    mail to: @user.email, subject: "Feedback from #{@user.name}, #{@user.email}"
  end
end
