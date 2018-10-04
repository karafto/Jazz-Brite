class AddEventnameToInvites < ActiveRecord::Migration[5.1]
  def change
    add_column :invites, :event_name, :string
  end
end
