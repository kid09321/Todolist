class AddDatetimeToList < ActiveRecord::Migration
  def change
    add_column :lists, :completed_at, :timestamp
  end
end
