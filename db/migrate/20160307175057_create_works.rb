class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.boolean :is_complete

      t.timestamps null: false
    end
  end
end
