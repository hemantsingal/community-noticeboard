class CommunityAddColumnActiveAndDescription < ActiveRecord::Migration
  def up
  	add_column :communities, :active, :integer
  	add_column :communities, :description, :string
  end

  def down
  	remove_column :communities, :active
  	remove_column :communities, :description
  end
end
