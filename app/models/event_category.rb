class EventCategory < ApplicationRecord
  belongs_to :event
  belongs_to :category
  belongs_to :user
end
