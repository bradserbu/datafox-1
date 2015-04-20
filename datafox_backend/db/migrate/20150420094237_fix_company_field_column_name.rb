class FixCompanyFieldColumnName < ActiveRecord::Migration
  def change
    rename_column :company_fields, :field, :name
  end
end
