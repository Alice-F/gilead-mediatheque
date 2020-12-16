class AddPasswordChangedAtReferencesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :password_changed_at
  end
end
