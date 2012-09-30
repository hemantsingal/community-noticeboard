class FixUserColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :mobile_numer, :mobile_number
  end
end
