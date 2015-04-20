class DropVcsTable < ActiveRecord::Migration
  def change
    drop_table :vcs
  end
end
