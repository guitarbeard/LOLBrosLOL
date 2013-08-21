class BoardController < ApplicationController
	def index
		@topics = Topic.limit(20).find(:all, :order => 'updated_at DESC')

	end

	def create_topic

	    user_id = session[:id]

	    user = User.find(user_id)

	    name = params[:name]

	    content = params[:content]

	    topic = user.topics.create(:name => name)

	    post = topic.posts.create(:content => content, :user_id => user_id)    

	    render(:json => {:success => true, :topic_id => topic.id})

  end

  def edit_thread

  	topic = Topic.find(params[:thread_id])

  	new_name = params[:new_name]

  	topic.name = new_name

  	topic.save

  	render(:json => {:success => true, :name => topic.name})

  end
  
end	