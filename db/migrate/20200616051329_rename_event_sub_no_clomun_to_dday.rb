class RenameEventSubNoClomunToDday < ActiveRecord::Migration[6.0]
  def change
    remove_column :ddays, :event_sub_no
    remove_column :users, :event_sub_no
    remove_column :users, :serial_no
    add_column :ddays, :event_sub_no, :integer
    add_column :users, :event_sub_no, :integer
    add_column :users, :serial_no, :integer
  end
end
