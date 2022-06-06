class Task < ApplicationRecord

  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
