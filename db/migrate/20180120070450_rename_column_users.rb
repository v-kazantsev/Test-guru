class RenameColumnUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :password_digest
  end
end
