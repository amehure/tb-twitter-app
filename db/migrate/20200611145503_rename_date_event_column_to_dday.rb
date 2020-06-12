class RenameDateEventColumnToDday < ActiveRecord::Migration[6.0]
  def change
    rename_column :ddays, :date_event, :event_date
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
