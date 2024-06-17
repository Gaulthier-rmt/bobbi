class Poll < ApplicationRecord
  belongs_to :event

  has_many :options, dependent: :destroy
  has_many :votes, through: :options
end
