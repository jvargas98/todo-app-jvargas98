class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    @users = User.all

    @users.each do |user|
      unless user.lists?
        #puts user.email
        user.get_pending_tasks
        WeeklyMailer.with(user: user).weekly_email.deliver_now
      end
    end
  end
end
