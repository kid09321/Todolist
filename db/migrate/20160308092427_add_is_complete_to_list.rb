class AddIsCompleteToList < ActiveRecord::Migration
  def change
    add_column :lists, :is_complete, :boolean, default: false
  end
end
