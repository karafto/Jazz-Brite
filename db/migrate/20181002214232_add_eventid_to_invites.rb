class AddEventidToInvites < ActiveRecord::Migration[5.1]
  def change
    add_column :invites, :event_id, :integer
  end
end
