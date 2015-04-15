class AddVcToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :vc, index: true, foreign_key: true
  end
end
