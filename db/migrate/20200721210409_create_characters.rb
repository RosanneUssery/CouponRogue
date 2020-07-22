class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.integer :characterId
      t.string :name
      t.integer :level
      t.integer :experience
      t.integer :health
      t.integer :discount
      t.boolean :isDead
      t.integer :currentRoom

      t.timestamps
    end
  end
end
