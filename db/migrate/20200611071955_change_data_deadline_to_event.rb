class ChangeDataDeadlineToEvent < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :deadline
    add_column :events, :deadline, :datetime
  end
end
