class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :contents
      t.integer :days_held
      t.string :organizar
      t.time :deadline
      t.boolean :multipl_entries

      t.timestamps
    end
  end
end
