class AddCompanyToVc < ActiveRecord::Migration
  def change
    add_reference :vcs, :company, index: true, foreign_key: true
  end
end
