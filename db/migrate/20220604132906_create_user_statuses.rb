class CreateUserStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end

    add_index(:user_statuses, :name)
    add_index(:user_statuses, [:user_id, :name], unique: true)
  end
end
