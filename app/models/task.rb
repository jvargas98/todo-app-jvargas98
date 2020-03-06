class Task < ApplicationRecord
  validates :name, :text, presence: true
  belongs_to :list

  def self.to_csv
    column = %w{Task_name Description Status}
    column_names = %w{name text}
    CSV.generate(headers: true) do |csv|
      csv << [all[0].list.name]
      csv << column
      all.each do |task|
        row = task.attributes.values_at(*column_names)
        row << (task.status == 1 ? "Done" : "Undone")
        csv << row
      end
    end
  end
end
