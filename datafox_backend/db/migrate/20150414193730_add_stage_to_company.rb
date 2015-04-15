class AddStageToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :stage, :string
  end
end
