class CreateActivitiesCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :activities_categories, id: false do |t|
      t.belongs_to :activity
      t.belongs_to :category
    end

    add_index :activities_categories , [:activity_id , :category_id] , :unique => true
  end
end
