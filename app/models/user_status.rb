class UserStatus < ApplicationRecord
  include AASM

  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true

  aasm(whiny_transitions: false, column: :name, skip_validation_on_save: true) do
    state :new, initial: true
    state :active
    state :inactive

    event :activate do
      transitions from: :new, to: :active

      after_commit do
        # send activation email
      end
    end

    event :deactivate do
      before do
        # send warning deactivation email
      end

      transitions from: :active, to: :inactive
    end
  end
end
