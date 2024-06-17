class Group < ApplicationRecord
  has_many :event_groups
  has_many :events, through: :event_groups

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
