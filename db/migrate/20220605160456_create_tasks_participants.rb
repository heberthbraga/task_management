class CreateTasksParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks_participants, id: false do |t|
      t.belongs_to :user
      t.belongs_to :task
    end

    add_index :tasks_participants , [:user_id , :task_id] , :unique => true
  end
end
