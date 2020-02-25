class RemoveStartDateFromTasks < ActiveRecord::Migration[6.0]
  def change

    remove_column :tasks, :start_date, :datetime
  end
end
