class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.text :task,             null: false
      t.date :time,             null: false
      t.datetime :done_at
      t.timestamps
    end
  end
end
