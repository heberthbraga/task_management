class Category < ApplicationRecord
  has_and_belongs_to_many :activities

  default_scope { order(created_at: :desc) }

  validates :name, presence: true
end
