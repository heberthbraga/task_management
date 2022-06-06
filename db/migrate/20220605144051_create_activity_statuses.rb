class CreateActivityStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_statuses do |t|
      t.references :activity, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end

    add_index(:activity_statuses, :name)
    add_index(:activity_statuses, [:activity_id, :name], unique: true)
  end
end
