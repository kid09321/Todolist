class AddDefaultTypeToIsComplete < ActiveRecord::Migration
  def change
    change_column :works, :is_complete, 'integer USING CAST(is_complete AS integer)'
  end
end
