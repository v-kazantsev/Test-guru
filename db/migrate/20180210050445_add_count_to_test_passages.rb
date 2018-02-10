class AddCountToTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :count, :integer
  end
end
