class Recipe < ApplicationRecord
  belongs_to :event
  has_many :ingredients, dependent: :destroy
end
