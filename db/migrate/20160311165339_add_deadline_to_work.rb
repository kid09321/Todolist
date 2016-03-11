class AddDeadlineToWork < ActiveRecord::Migration
  def change
    add_column :works, :deadline, :datetime
  end
end
