class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.integer :attack
      t.string :name

      t.timestamps
    end
  end
end
