class CreateEventAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :event_attendances do |t|

      t.timestamps
    end
  end
end
