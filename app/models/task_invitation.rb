class TaskInvitation < ApplicationRecord
  belongs_to :user
  belongs_to :task
  belongs_to :invitation_type

  validates :user, presence: true
  validates :task, presence: true
  validates :invitation_type, presence: true
  validates :send_date, presence: true

end
