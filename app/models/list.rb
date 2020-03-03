class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  def tasks?
    self.tasks.empty?
  end
end
