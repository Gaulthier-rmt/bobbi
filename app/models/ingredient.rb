class Ingredient < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event
  belongs_to :manager, class_name: "User", foreign_key: "manager_id", optional: true
  validates :name, presence: true
end
