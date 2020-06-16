class RenameEventSubNoClomunToDday < ActiveRecord::Migration[6.0]
  def change
    change_column :ddays, :event_sub_no, :integer
    change_column :users, :event_sub_no, :integer
    change_column :users, :serial_no, :integer
  end
end
