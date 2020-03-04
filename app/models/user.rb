class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :description, :email, :password, presence: true
  validates :email, uniqueness: true
  has_many :lists, dependent: :destroy
  has_one_attached :avatar
  validates :avatar, file_size: { less_than_or_equal_to: 100.kilobytes },
                     file_content_type: { allow: ["image/jpeg", "image/png"] }

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
