class Post < ActiveRecord::Base

	belongs_to :topic
	belongs_to :user
	has_many :brofists
	has_many :bitchslaps

	attr_accessible :content, :topic_id, :user_id

end