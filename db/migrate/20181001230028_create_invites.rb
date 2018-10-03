class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.integer :sender_id
      t.string :recipient_email
      t.datetime :sent_at

      t.timestamps
    end
  end
end
