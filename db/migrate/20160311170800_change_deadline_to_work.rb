class ChangeDeadlineToWork < ActiveRecord::Migration
  def change
    change_column :works, :deadline, :date
  end
end
