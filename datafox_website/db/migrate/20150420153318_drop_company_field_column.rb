class DropCompanyFieldColumn < ActiveRecord::Migration
  def change
    remove_column :companies, :fields
  end
end
