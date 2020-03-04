class WeeklyMailer < ApplicationMailer
  default from: "todo.app.bc@gmail.com"

  def weekly_email
    @user = params[:user]
    @lists = @user.lists
    @url = "http://todo-app.com/login"
    mail(to: @user.email, subject: "Pending tasks #{Time.now.strftime("%m/%d/%Y")}")
  end
end
