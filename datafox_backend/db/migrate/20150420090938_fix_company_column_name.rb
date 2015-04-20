class FixCompanyColumnName < ActiveRecord::Migration
  def change
    rename_column :companies, :field, :fields
  end
end
