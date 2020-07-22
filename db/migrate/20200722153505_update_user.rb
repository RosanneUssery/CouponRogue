class UpdateUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.remove :idToken
      t.string :password_digest, null: false
      t.string :userName, null: false
    end
    # change_column :users, :userName, :string, null: false
    # add_column :users, :password_digest, :string, null: false
    # remove_column :users, :idToken, :string
  end
end
