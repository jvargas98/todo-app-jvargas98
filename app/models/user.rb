class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lists
  has_one_attached :avatar

  def get_pending_tasks
    pending_tasks = Array.new
    self.lists.each do |list|
      unless list.tasks?
        #puts " " + list.name
        @tasks = list.tasks
        @tasks.each do |task|
          list.tasks.delete(task) if task.status == 1
        end
      end
    end
  end

  def lists?
    self.lists.empty?
  end
end
