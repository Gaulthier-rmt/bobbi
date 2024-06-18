class Option < ApplicationRecord
  belongs_to :poll
  has_many :votes

  validates :name, presence: true
  validates :poll_id, presence: true, uniqueness: { scope: :name }
end
