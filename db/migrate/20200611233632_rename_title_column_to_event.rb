class RenameTitleColumnToEvent < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :title, :event_name

  end
end
