class TopicsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(
      description: params[:description],
      user_id: @current_user.id
    )
    if @topic.save
      flash[:notice] = "投稿完了！"
      redirect_to("/topics/index")
    else
      render("topics/new")
    end
  end
  
  def index
    @topics = Topic.all.order(created_at: :desc)
  end
  
  def show
    @topic = Topic.find_by(id: params[:id])
    @user = @topic.user
  end
  
  def edit
    @topic = Topic.find_by(id: params[:id])
  end
  
  def update
    @topic = Topic.find_by(id: params[:id])
    @topic.description = params[:description]
    if @topic.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/topics/index")
    else
      render("topics/edit")
    end
  end
  
  def destroy
    @topic = Topic.find_by(id: params[:id])
    @topic.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/topics/index")
  end
  
  def ensure_correct_user
    @topic = Topic.find_by(id: params[:id])
    if @topic.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/topics/index")
    end
  end
end
