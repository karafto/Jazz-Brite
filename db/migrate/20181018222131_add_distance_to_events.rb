class AddDistanceToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :distance_from_visitor, :float
  end
end
