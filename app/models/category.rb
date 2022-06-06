class Category < ApplicationRecord
  has_and_belongs_to_many :activities

  validates :name, presence: true
end
