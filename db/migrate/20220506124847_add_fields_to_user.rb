class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string, :after => "email"
    add_column :users, :last_name, :string, :after => "first_name"
    add_column :users, :birthdate, :datetime, :after => "last_name"
    add_column :users, :gender, :string, :after => "birthdate"
    add_column :users, :active, :boolean, default: true
  end
end
