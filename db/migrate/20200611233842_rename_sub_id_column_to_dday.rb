class RenameSubIdColumnToDday < ActiveRecord::Migration[6.0]
  def change
    rename_column :ddays, :sub_id, :event_sub_no
  end
end
