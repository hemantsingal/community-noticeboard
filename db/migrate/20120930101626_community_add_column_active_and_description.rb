class CommunityAddColumnActiveAndDescription < ActiveRecord::Migration
  def up
  	add_column :communities, :active, :integer
  	add_column :communities, :description, :string
  end

  def down
  end
end
