class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :companies, :type, :category
  end
end
