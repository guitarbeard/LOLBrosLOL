class User < ActiveRecord::Base
	has_many :topics
	has_many :posts
	has_many :brofists
	has_many :bitchslaps

	attr_accessible :name, :email, :img_src, :password
	
end