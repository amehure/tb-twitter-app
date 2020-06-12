class RenameSerialNumColumnToUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :serial_num, :serial_no
  end
end
