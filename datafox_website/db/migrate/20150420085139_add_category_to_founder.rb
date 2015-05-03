class AddCategoryToFounder < ActiveRecord::Migration
  def change
    add_column :founders, :category, :string
  end
end
