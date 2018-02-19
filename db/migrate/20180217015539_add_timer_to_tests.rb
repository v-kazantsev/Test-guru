class AddTimerToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :countdown, :integer, default: 0
  end
end
