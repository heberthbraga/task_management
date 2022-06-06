class CreateTaskStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :task_statuses do |t|
      t.references :task, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end

    add_index(:task_statuses, :name)
    add_index(:task_statuses, [:task_id, :name], unique: true)
  end
end
