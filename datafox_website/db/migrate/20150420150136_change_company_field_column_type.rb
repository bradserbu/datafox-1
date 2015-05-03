class ChangeCompanyFieldColumnType < ActiveRecord::Migration
  def change
    remove_column :companies, :fields
  end  
end
