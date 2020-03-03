class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    @users = User.all

    @users.each do |user|
      unless user.lists?
        puts user.email
        user.get_pending_tasks

        user.lists.each do |list|
          @tasks = list.tasks
          @tasks.each do |task|
            puts task.name
          end
        end
      end
      #WeeklyMailer.with(user: user).weekly_email.deliver_now
    end
  end
end
