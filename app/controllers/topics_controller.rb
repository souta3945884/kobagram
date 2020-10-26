class TopicsController < ApplicationController
  before_action :authenticate_user
  
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(description: params[:description])
    if @topic.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/topics/index")
    else
      render("topics/new")
    end
  end
  
  def index
    @topics = Topic.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def edit
    @topic = Topic.find_by(id: params[:id])
  end
  
  def update
    @topic = Topic.find_by(id: params[:id])
    @topic.description = params[:description]
    @topic.save
    redirect_to("/topics/index")
  end
end
