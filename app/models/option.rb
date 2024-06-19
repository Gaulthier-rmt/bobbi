class Option < ApplicationRecord
  belongs_to :poll
  has_many :votes, dependent: :destroy

  validates :title, presence: true
  validates :poll_id, presence: true, uniqueness: { scope: :title }
end
