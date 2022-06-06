class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end

    add_index(:tasks, :title)
    add_index(:tasks, :start_date)
    add_index(:tasks, :end_date)
    add_index(:tasks, [:title, :start_date, :end_date])
  end
end
