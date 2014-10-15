class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :user_id, null: false
      t.integer :stadium_id, null: false
      t.string :title, null: false
      t.text :summary, null: false
      t.integer :food, null: false
      t.integer :atmosphere, null: false
      t.integer :neighborhood, null: false
      t.integer :fans, null: false


      t.timestamps
    end

  end
end
