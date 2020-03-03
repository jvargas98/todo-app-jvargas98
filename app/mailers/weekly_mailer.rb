class WeeklyMailer < ApplicationMailer
  default from: "todo.app.bc@gmail.com"

  def weekly_email
    @user = params[:user]
    @url = "http://example.com/login"
    mail(to: @user.email, subject: "Pending tasks")
  end
end
