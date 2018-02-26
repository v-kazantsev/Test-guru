class AddRulesToBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :rule, :string
    add_column :badges, :rule_value, :string
  end
end
