class ActivityStatus < ApplicationRecord
  include AASM

  belongs_to :activity

  validates :name, presence: true
  validates :activity, presence: true

  aasm(whiny_transitions: false, column: :name, skip_validation_on_save: true) do
    state :new, initial: true
    state :active
    state :closed

    event :start do
      transitions from: :new, to: :active

      after_commit do
        # send activation email
      end
    end

    event :finish do
      before do
        # send warning deactivation email
      end

      transitions from: :active, to: :closed
    end
  end
end
