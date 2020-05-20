class AddModulesForFormattingToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :text_formatting, :string
  end
end
