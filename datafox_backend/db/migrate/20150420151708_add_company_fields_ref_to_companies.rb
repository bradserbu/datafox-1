class AddCompanyFieldsRefToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :fields, index: true, foreign_key: true
  end
end
