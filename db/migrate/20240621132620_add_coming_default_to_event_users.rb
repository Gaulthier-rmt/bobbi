class AddComingDefaultToEventUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :event_users, :coming, from: nil, to: true
  end
end
