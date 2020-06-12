class AddColumnEventIdToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_id, :string
  end
end
