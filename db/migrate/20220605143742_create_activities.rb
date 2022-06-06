class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.integer :owner_id

      t.timestamps
    end
  end
end
