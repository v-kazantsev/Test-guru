class AddTestsPassedToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :test_passed, :boolean
  end
end
