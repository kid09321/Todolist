class AddBooleanToWork < ActiveRecord::Migration
  def change
    change_column :works, :is_complete, :boolean, default: false
  end
end
