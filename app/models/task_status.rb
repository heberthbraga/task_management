class TaskStatus < ApplicationRecord
  include AASM

  belongs_to :task

  validates :name, presence: true
  validates :task, presence: true

  aasm(whiny_transitions: false, column: :name, skip_validation_on_save: true) do
    state :new, initial: true
    state :in_progress
    state :reset
    state :completed

    event :start do
      transitions from: :new, to: :in_progress

      after_commit do
        # send activation email
      end
    end

    event :reset do
      before do
        # send warning deactivation email
      end

      transitions from: :in_progress, to: :reset
    end

    event :finish do
      transitions from: :in_progress, to: :completed
    end
  end
end
