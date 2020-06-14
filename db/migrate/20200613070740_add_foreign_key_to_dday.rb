class AddForeignKeyToDday < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :dday, foreign_key: true
  end
end
