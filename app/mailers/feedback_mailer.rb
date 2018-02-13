class FeedbackMailer < ApplicationMailer
  def feedback(current_user, message_body)
    @user = current_user
    @admin = User.where(type: "Admin").first
    @message = message_body
    mail to: @admin.email, subject: "Feedback from #{@user.name}, #{@user.email}"
  end
end
