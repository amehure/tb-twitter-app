class RenameMultiplEntriesColumnToEvent < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :multipl_entries, :multiple_entries
  end
end
