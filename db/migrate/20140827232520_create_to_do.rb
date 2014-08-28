class CreateToDo < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :due_date
      t.boolean :done
      t.timestamps
    end
  end
end
