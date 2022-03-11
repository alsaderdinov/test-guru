class AddRuleParamToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule_param, :string
  end
end

