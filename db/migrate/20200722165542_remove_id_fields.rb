class RemoveIdFields < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.remove :userId
    end
    change_table :characters do |t|
      t.remove :characterId
    end
  end
end
