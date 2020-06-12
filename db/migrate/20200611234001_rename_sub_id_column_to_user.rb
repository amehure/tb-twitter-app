class RenameSubIdColumnToUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :sub_id, :event_sub_no

  end
end
