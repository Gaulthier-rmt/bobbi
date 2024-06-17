class Vote < ApplicationRecord
  belongs_to :event_user
  belongs_to :option
end
