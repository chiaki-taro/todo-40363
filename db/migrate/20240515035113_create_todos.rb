class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.text :task
      t.date :time
      t.datetime :done_at
      t.timestamps
    end
  end
end
