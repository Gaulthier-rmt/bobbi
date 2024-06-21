class Ingredient < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
end
