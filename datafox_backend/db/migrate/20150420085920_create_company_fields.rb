class CreateCompanyFields < ActiveRecord::Migration
  def change
    create_table :company_fields do |t|
      t.string :field
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
