class AddColumnsToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :title, :string
    add_column :events, :location, :string
    add_column :events, :date, :datetime
  end
end
