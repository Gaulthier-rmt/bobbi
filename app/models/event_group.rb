class EventGroup < ApplicationRecord
  belongs_to :group
  belongs_to :event

  validates :group_id, uniqueness: { scope: :event_id }
end
