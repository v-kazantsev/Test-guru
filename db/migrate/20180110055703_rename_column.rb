class RenameColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :password, :email
  end
end
