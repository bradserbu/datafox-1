class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :name
      t.string :category
      t.string :location
      t.string :field
      t.text :detail
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
