class AddLevelToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :level, :integer
  end
end
