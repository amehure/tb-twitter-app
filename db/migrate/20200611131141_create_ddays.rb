class CreateDdays < ActiveRecord::Migration[6.0]
  def change
    create_table :ddays do |t|
      t.string :event_id
      t.string :sub_id
      t.datetime :date_event
      t.string :decision
      t.integer :max_num
      t.string :zoom_url
      t.string :zoom_id
      t.string :zoom_pass

      t.timestamps
    end
  end
end
