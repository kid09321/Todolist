class AddDefaultTypeToIsComplete < ActiveRecord::Migration
  def change
    change_column :works, :is_complete, :integer, default: 0
  end
end
