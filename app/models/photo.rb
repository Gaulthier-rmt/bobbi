class Photo < ApplicationRecord
  has_one_attached :photo

  belongs_to :event
  belongs_to :user
  belongs_to :group, optional: true
end
