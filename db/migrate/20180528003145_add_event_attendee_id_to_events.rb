class AddEventAttendeeIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_attendee_id, :integer
  end
end
