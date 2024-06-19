class Event < ApplicationRecord
  # has_one_attached :photo

  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories
  has_many :event_groups, dependent: :destroy
  has_many :groups, through: :event_groups
  has_many :photos
  has_many :recipes, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :ingredients, through: :recipes, dependent: :destroy
  has_many :polls, dependent: :destroy
  has_many :poll_options, through: :polls

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :address, presence: true
end
