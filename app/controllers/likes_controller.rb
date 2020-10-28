class LikesController < ApplicationController
  # before_actionに「:authenticate_user」を追加してください
  before_action :authenticate_user
  
  # createアクションを追加してください
  def create
    @like = Like.new(user_id: @current_user.id, topic_id: params[:topic_id])
    @like.save
    redirect_to("/topics/#{params[:topic_id]}")
  end
  
  def destroy
    @like = Like.find_by(user_id: @current_user.id, topic_id: params[:topic_id])
    @like.destroy
    redirect_to("/topics/#{params[:topic_id]}")
  end
  
end