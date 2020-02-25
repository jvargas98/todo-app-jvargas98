class RemoveEndDateFromTasks < ActiveRecord::Migration[6.0]
  def change

    remove_column :tasks, :end_date, :datetime
  end
end
