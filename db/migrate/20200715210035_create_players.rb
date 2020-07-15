class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.integer :discount
      t.integer :experience

      t.timestamps
    end
  end
end
