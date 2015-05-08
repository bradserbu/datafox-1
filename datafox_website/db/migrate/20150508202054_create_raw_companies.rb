class CreateRawCompanies < ActiveRecord::Migration
  def change
    create_table :raw_companies do |t|
      t.string :name
      t.string :location
      t.string :founded
      t.string :team
      t.string :investor
      t.string :field
      t.string :buzimodel
      t.string :url
      t.string :stage
      t.text :news
      t.string :source
      t.text :desc

      t.timestamps null: false
    end
  end
end
