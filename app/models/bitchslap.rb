class Bitchslap < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	attr_accessible :user_id, :giver_id, :post_id
end