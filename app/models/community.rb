class Community < ActiveRecord::Base
	attr_accessible :name, :active, :description

	validates_presence_of :name
	validates_uniqueness_of :name
end
