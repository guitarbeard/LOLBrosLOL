class TopicsController < ApplicationController
	def index
		@topic = Topic.find(params[:id])
		@posts = @topic.posts.all
		@topic.views = @topic.views + 1
		@topic.save
	end

	def create_post

	    user_id = session[:id]

	    user = User.find(user_id)

	    thread_id = params[:thread_id]

	    content = params[:content]

	    topic = Topic.find(thread_id)

	    post = topic.posts.create(:content => content, :user_id => user_id)   

	    Time.zone = 'Pacific Time (US & Canada)' 
		post_date = Time.zone.parse(post.created_at.to_s).strftime("%b %d %Y at %I:%M %p") 

	    render(:json => {:success => true, :user => user, :post => post, :post_date => post_date})

  end

  def edit_post

	    user_id = session[:id]

	    user = User.find(user_id)

	    post_id = params[:post_id]

	    content = params[:content]

	    post = Post.find(post_id)

	    post.content = content

	    post.save 

	    render(:json => {:success => true, :new_content => post.content})

  end

  def add_brofist
  	giver_id = session[:id]

  	giver_name = User.find(giver_id).name

	post_id = params[:post_id]

	post = Post.find(post_id)

	user_id = post.user.id

	brofist = Brofist.create(:post_id => post_id, :giver_id => giver_id, :user_id => user_id)

	render(:json => {:success => true, :giver_name => giver_name, :fist_id => brofist.id})

  end

  def add_bitchslap
  	giver_id = session[:id]

  	giver_name = User.find(giver_id).name

	post_id = params[:post_id]

	post = Post.find(post_id)

	user_id = post.user.id

	bitchslap = Bitchslap.create(:post_id => post_id, :giver_id => giver_id, :user_id => user_id)

	render(:json => {:success => true, :giver_name => giver_name, :slap_id => bitchslap.id})

  end

  def remove_brofist

  	fist_id = params[:fist_id]

	Brofist.find(fist_id).destroy

	render(:json => {:success => true})

  end

  def remove_bitchslap

  	slap_id = params[:slap_id]

	Bitchslap.find(slap_id).destroy

	render(:json => {:success => true})

  end

end