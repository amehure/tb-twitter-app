class ChangeDataDeadlineToEvent < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :deadline, :datetime
  end
end
