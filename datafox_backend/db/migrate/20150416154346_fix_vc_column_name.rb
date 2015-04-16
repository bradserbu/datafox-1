class FixVcColumnName < ActiveRecord::Migration
  def change
    rename_column :companies, :vc_id, :investor_id
  end
end
