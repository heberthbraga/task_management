class CreateInvitationTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :invitation_types do |t|
      t.string :name

      t.timestamps
    end

    add_index(:invitation_types, :name)
  end
end
