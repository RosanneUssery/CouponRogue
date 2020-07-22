class UpdateUserNameAddPassword < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.remove :idToken
      t.string :password_digest, null: false
      t.change :userName, :string, null: false
    end
  end
end
