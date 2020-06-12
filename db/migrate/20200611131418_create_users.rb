class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :event_id
      t.string :sub_id
      t.string :serial_num
      t.string :twitter_screenname

      t.timestamps
    end
  end
end
