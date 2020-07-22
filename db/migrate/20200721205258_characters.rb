class Characters < ActiveRecord::Migration[6.0]
  def change
    drop_table :characters do |t|
      t.integer "level"
      t.integer "health"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
    end
  end
