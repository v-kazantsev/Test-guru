class AddTestsPassedToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tests_passed, :integer, default: 0
  end
end
