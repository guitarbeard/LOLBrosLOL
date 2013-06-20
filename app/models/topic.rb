class Topic < ActiveRecord::Base
	
	belongs_to :user
	has_many :posts

	attr_accessible :name, :user_id 
	
end