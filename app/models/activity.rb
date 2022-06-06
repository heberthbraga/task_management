class Activity < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_one :activity_status
  has_and_belongs_to_many :cateogories

  validates :name, presence: true
  validates :text, presence: true
  validates :owner, presence: true
end
