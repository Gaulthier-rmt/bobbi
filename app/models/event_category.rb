class EventCategory < ApplicationRecord
  belongs_to :event
  belongs_to :category
  belongs_to :user, optional: true

  # validates :category_id, uniqueness: { scope: :user_id }
end
