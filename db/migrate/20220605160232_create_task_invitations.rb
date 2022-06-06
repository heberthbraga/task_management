class CreateTaskInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :task_invitations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.references :invitation_type, null: false, foreign_key: true
      t.datetime :send_date
      t.text :text_response
      t.datetime :response_date

      t.timestamps
    end

    add_index(:task_invitations, :send_date)
    add_index(:task_invitations, [:user_id, :task_id, :send_date])
  end
end
