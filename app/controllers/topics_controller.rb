class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(description: params[:description])
    @topic.save
    redirect_to("/topics/index")
  end
  
  def index
    @topics = Topic.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(user_id: params[:user_id])
  end
end
