class AddForeignKeyToEvent < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :event_id, :event_no
    rename_column :ddays, :event_id, :event_no
    rename_column :users, :event_id, :event_no
    add_reference :ddays, :event, foreign_key: true
  end
end
