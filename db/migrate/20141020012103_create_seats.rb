class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :user_id, null: false
      t.integer :stadium_id, null: false
      t.string :section, null: false
      t.integer :seat_number, null: false
      t.string :row, null: false
      t.text :seat_description, null: false
      t.timestamps
    end
  end
end
