class AddInvestorToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :investor, index: true, foreign_key: true
  end
end
