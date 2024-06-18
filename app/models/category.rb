class Category < ApplicationRecord
  has_many :event_categories, dependent: :destroy
  has_many :events, through: :event_categories

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
