class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :type
      t.integer :year
      t.string :stage
      t.string :field
      t.text :detail

      t.timestamps null: false
    end
  end
end
