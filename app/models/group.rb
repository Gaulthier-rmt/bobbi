class Group < ApplicationRecord
  has_many :event_groups
  has_many :events, through: :event_groups
  has_many :group_users
  has_many :users, through: :group_users

  validates :name, presence: true, uniqueness: true
end
